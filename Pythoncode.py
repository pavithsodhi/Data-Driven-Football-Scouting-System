import pandas as pd
from sqlalchemy import create_engine
from tkinter import *
from tkinter import ttk

# SQLAlchemy connection setup
def connect_to_database():
    # Update '12345678' with your actual root password if needed
    DATABASE_URL = 'mysql+pymysql://root:12345678@localhost:3306/final_dbms_project'
    engine = create_engine(DATABASE_URL)
    return engine

# Fetch data from tables
def fetch_data():
    engine = connect_to_database()
    tables = [
        'teamtable', 'playertable', 'matchstatstable', 'shotefficiencytable',
        'passingstatstable', 'defensivestatstable', 'possessionstatstable',
        'discipplinestatstable', 'airialstatstable', 'dribblingstatstable',
        'gca_scastatstable'
    ]
    data = {}
    for table in tables:
        query = f"SELECT * FROM {table}"
        data[table] = pd.read_sql(query, engine)
    return data

data = fetch_data()

# Initialize main window
root = Tk()
root.title("Football Scouting System")
root.geometry("600x800")

# Define filter sections
Label(root, text="Select Criteria", font=("Helvetica", 16)).pack(pady=10)

# Add a Canvas and Scrollbar for scrolling the filter area
canvas = Canvas(root)
scrollbar = Scrollbar(root, orient="vertical", command=canvas.yview)
canvas.config(yscrollcommand=scrollbar.set)

scrollbar.pack(side="right", fill="y")
canvas.pack(side="left", expand=True, fill="both")

# Create a frame inside the canvas where all widgets will be added
criteria_frame = Frame(canvas)
canvas.create_window((0, 0), window=criteria_frame, anchor="nw")

# Configure scrolling when the content is larger than the window
criteria_frame.bind("<Configure>", lambda e: canvas.configure(scrollregion=canvas.bbox("all")))

# Common Filters
Label(criteria_frame, text="Common Filters", font=("Helvetica", 12, 'bold')).grid(row=0, column=0, columnspan=2)
Label(criteria_frame, text="League:").grid(row=1, column=0, padx=10)
league_filter = ttk.Combobox(criteria_frame, values=data['teamtable']['Comp'].unique().tolist())
league_filter.grid(row=1, column=1, padx=10)

Label(criteria_frame, text="Position:").grid(row=2, column=0, padx=10)
position_filter = ttk.Combobox(criteria_frame, values=data['playertable']['Pos'].unique().tolist())
position_filter.grid(row=2, column=1, padx=10)

Label(criteria_frame, text="Max Age:").grid(row=3, column=0, padx=10)
age_filter = Entry(criteria_frame)
age_filter.grid(row=3, column=1, padx=10)

Label(criteria_frame, text="Min Matches Played:").grid(row=4, column=0, padx=10)
matches_played_filter = Entry(criteria_frame)
matches_played_filter.grid(row=4, column=1, padx=10)

Label(criteria_frame, text="Min Starts:").grid(row=5, column=0, padx=10)
starts_filter = Entry(criteria_frame)
starts_filter.grid(row=5, column=1, padx=10)

Label(criteria_frame, text="Player Name:").grid(row=6, column=0, padx=10)
player_name_filter = Entry(criteria_frame)
player_name_filter.grid(row=6, column=1, padx=10)

playstyle_sections = [
    ("Possession-Based", [
        ("PassCompleted_percent", "Min Passing Accuracy (%)"),
        ("ShortPasses_percent", "Min Short Passes (%)"),
        ("Progressive_PassesDist", "Min Progressive Passing Distance"),
        ("TouMid3rd", "Min Touches in Middle 3rd"),
        ("TouAtt3rd", "Min Touches in Attacking 3rd"),
        ("Shot_Creating_Actions", "Min Shot Creating Actions")
    ]),
    ("Counter-Attacking", [
        ("LongPasses_percent", "Min Long Passes (%)"),
        ("Progressive_PassesDist", "Min Progressive Passing Distance"),
        ("Shot_Creating_Actions", "Min Shot Creating Actions"),
        ("OpenPlay_Shot_Creating_Passes", "Min Open Play Shot Creating Passes"),
        ("TakeOns_Suc_percent", "Min Successful Take-Ons (%)"),
        ("CarProg", "Min Progressive Carries"),
        ("TouDef3rd", "Min Touches in Defensive 3rd")
    ]),
    ("Pressing/High Intensity", [
        ("TklAtt3rd", "Min Tackles in Attacking 3rd"),
        ("Tkl_plus_Int", "Min Tackles + Interceptions"),
        ("Dribblers_Tackeled_percent", "Min Dribbler Tackled (%)"),
        ("AerWon_percent", "Min Aerial Duels Won (%)"),
        ("Fls", "Max Fouls"),
        ("FlsDrawn", "Max Fouls Drawn")
    ]),
    ("Defensive/Low Block", [
        ("AerWon", "Min Aerial Duels Won"),
        ("AerWon_percent", "Min Aerial Duels Won (%)"),
        ("TklDef3rd", "Min Tackles in Defensive 3rd"),
        ("Blocks", "Min Blocks"),
        ("Clr", "Min Clearances"),
        ("Err", "Min Errors"),
        ("TouDefPen", "Min Touches in Defensive Penalty Area"),
        ("TouDef3rd", "Min Touches in Defensive 3rd"),
        ("CrdY", "Max Yellow Cards"),
        ("CrdR", "Max Red Cards")
    ]),
    ("Direct/Long-Ball", [
        ("LongPasses_percent", "Min Long Passes (%)"),
        ("LongPasses", "Min Long Passes"),
        ("Passes_into_final_3rd", "Min Passes into Final 3rd"),
        ("AerWon", "Min Aerial Duels Won"),
        ("AerWon_percent", "Min Aerial Duels Won (%)"),
        ("TouAtt3rd", "Min Touches in Attacking 3rd")
    ]),
    ("Creative/Playmaking", [
        ("Shot_Creating_Actions", "Min Shot Creating Actions"),
        ("Goal_Creating_Actions", "Min Goal Creating Actions"),
        ("Crosses_into_the_box", "Min Crosses into the Box"),
        ("PassesLeading_to_Shot", "Min Passes Leading to Shot"),
        ("Assists", "Min Assists"),
        ("Passes_into_final_3rd", "Min Passes into Final 3rd")
    ]),
    ("Goal-Scoring/Finisher", [
        ("Goals", "Min Goals"),
        ("SoT", "Min Shots on Target"),
        ("SoT_percent", "Min Shots on Target (%)"),
        ("G_Sh", "Min Goals per Shot"),
        ("G_SoT", "Min Goals per Shot on Target"),
        ("PK_scored", "Min Penalty Kicks Scored"),
        ("PK_attempted", "Max Penalty Kicks Attempted")
    ])
]

# Dynamic creation of filters based on playstyle
filters = {}  # Store all filter entries for later use
row_counter = 10    

for playstyle, attributes in playstyle_sections:
    Label(criteria_frame, text=f"{playstyle} Filters", font=("Helvetica", 12, 'bold')).grid(row=row_counter, column=0, columnspan=2, pady=(10, 0))
    row_counter += 1
    for attr, label_text in attributes:
        Label(criteria_frame, text=label_text + ":").grid(row=row_counter, column=0, padx=10)
        entry = Entry(criteria_frame)
        entry.grid(row=row_counter, column=1, padx=10)
        filters[attr] = entry
        row_counter += 1

def filter_results():
    league = league_filter.get()
    position = position_filter.get()
    age = age_filter.get()
    matches_played = matches_played_filter.get()
    starts = starts_filter.get()
    player_name = player_name_filter.get()

    # Merge player and team tables first using Team_ID
    merged_df = pd.merge(data['playertable'], data['teamtable'], on='Team_ID', how='left')
    
    # Loop through remaining tables and merge using Player_ID
    for table_name in data.keys():
        if table_name not in ['playertable', 'teamtable']:
            merged_df = pd.merge(merged_df, data[table_name], on='Player_ID', how='left')

    if league:
        merged_df = merged_df[merged_df['Comp'] == league]
    if position:
        merged_df = merged_df[merged_df['Pos'] == position]
    if age.isdigit():
        merged_df = merged_df[merged_df['Age'] <= int(age)]
    if matches_played.isdigit():
        merged_df = merged_df[merged_df['MP'] >= int(matches_played)]
    if starts.isdigit():
        merged_df = merged_df[merged_df['Starts'] >= int(starts)]
    if player_name:
        merged_df = merged_df[merged_df['Player'].str.contains(player_name, case=False, na=False)]

    # Apply playstyle filters
    for attr, entry in filters.items():
        val = entry.get()
        if val.isdigit():
            val = float(val)
            if attr in merged_df.columns:
                merged_df = merged_df[merged_df[attr] >= val]

    return merged_df

# Display filtered results in a new window
def display_results(df):
    results_window = Toplevel(root)
    results_window.title("Filtered Results")
    results_window.geometry("800x600")

    # Create a Treeview widget for displaying data
    tree = ttk.Treeview(results_window, show="headings")
    tree.pack(expand=True, fill="both")

    # Define the columns
    tree["columns"] = df.columns.tolist()

    # Configure the Treeview columns to adjust to the data width
    for col in df.columns:
        tree.heading(col, text=col) 
        max_width = max(df[col].astype(str).apply(len).max() if not df.empty else 1, len(col)) * 10
        tree.column(col, width=max_width, anchor="center")

    # Populate the Treeview with data
    for _, row in df.iterrows():
        tree.insert("", "end", values=row.tolist())

# Button to apply filter and display results
filter_button = Button(root, text="Filter", command=lambda: display_results(filter_results()))
filter_button.pack(pady=20)

root.mainloop()