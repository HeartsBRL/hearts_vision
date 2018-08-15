#!/usr/bin/env python

# vision constants

# The base_link coordinate frame is relative to the mobile robot base: x forward, y left(+ve)/right(-ve), z height
# see: http://www.ros.org/reps/rep-0103.html and http://www.ros.org/reps/rep-0105.html

# look straight ahead in base_link coordinate frame
AHEAD = {'x':1, 'y':0, 'z':0.6}

UP = {'x':1, 'y':0, 'z':1.1}
DOWN = {'x':1, 'y':0, 'z':0.1}
LEFT = {'x':1, 'y':0.5, 'z':0.6}
RIGHT = {'x':1, 'y':-0.5, 'z':0.6}

UP_LEFT = {'x':1, 'y':0.5, 'z':1.1}
UP_RIGHT = {'x':1, 'y':-0.5, 'z':1.1}
DOWN_LEFT = {'x':1, 'y':0.5, 'z':0.1}
DOWN_RIGHT = {'x':1, 'y':-0.5, 'z':0.1}

LOWE_RATIO = 0.8
