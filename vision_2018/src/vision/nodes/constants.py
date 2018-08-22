#!/usr/bin/env python

# vision constants

# The base_link coordinate frame is relative to the mobile robot base: x forward, y left(+ve)/right(-ve), z height
# see: http://www.ros.org/reps/rep-0103.html and http://www.ros.org/reps/rep-0105.html

# look straight ahead in base_link coordinate frame
AHEAD = {'x':1, 'y':0, 'z':1.0}

UP_HIGH = {'x':1, 'y':0, 'z':1.3}
UP = {'x':1, 'y':0, 'z':1.2}
DOWN = {'x':1, 'y':0, 'z':0.5}
LEFT = {'x':1, 'y':0.5, 'z':1.0}
RIGHT = {'x':1, 'y':-0.5, 'z':1.0}

UP_LEFT = {'x':1, 'y':0.5, 'z':1.2}
UP_RIGHT = {'x':1, 'y':-0.5, 'z':1.2}
DOWN_LEFT = {'x':1, 'y':0.5, 'z':0.5}
DOWN_RIGHT = {'x':1, 'y':-0.5, 'z':0.5}

LOWE_RATIO = 0.8

# predefined object-ids

PERSON_ID = 'person'
