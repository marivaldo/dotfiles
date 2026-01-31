# Creates a dev layout in Kitty
# +------------------+--------+
# |                  |   top  |
# |                  +--------+
# |      VIM         |  mid   |
# |                  +--------+
# |                  | bottom |
# +------------------+--------+

function dev_layout
    # Set your project path here
    set project_dir ~/Projects/your-project

    # Create 3 extra windows in the project folder
    kitty @ launch --cwd=$project_dir
    kitty @ launch --cwd=$project_dir
    kitty @ launch --cwd=$project_dir

    # Use tall layout: 1 large on the left (70%), rest stacked on the right
    kitty @ goto-layout tall

    # Focus on the first window (main panel)
    kitty @ focus-window --match num:0

    # Resize main panel to 70%
    kitty @ resize-window --increment 50

    # Navigate main panel to project
    cd $project_dir
end
