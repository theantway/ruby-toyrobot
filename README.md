Toy Robot Simulator Solution
============================

Description
-----------
This is the ruby version of Toy Robot simulator.

How to Build And Run
--------------------
You can run the application by:
```bash
    cd {PROJECT_ROOT_DIR}
    bundle install
    bin/robot
```

How to Play
-----------
Input commands to control robot after you started the application. Supported commands:
- Place x,y,(NORTH|EAST|SOUTH|WEST), e.g. PLACE 1,2,EAST
- Move: move one step towards current direction
- Left: turn left
- Right: turn right
- Report: report current location

Use Ctrl + D to quit the application

Any invalid commands are ignored, e.g. typo or invalid format PLACE command.

Implementation Details
----------------------
- This solution is using Command Pattern to control robot actions: place, left, right, move and report.
- Robot's state can only be changed in xxxCommand
- Because we are reading commands from console or stream, it's possible that the command is invalid.
  With the help of NoopCommand, there's no need for extra logic to handle invalid commands.
