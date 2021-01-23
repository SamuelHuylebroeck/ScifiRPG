{
  "spriteId": {
    "name": "spr_ui_pc_skill_block_off",
    "path": "sprites/spr_ui_pc_skill_block_off/spr_ui_pc_skill_block_off.yy",
  },
  "solid": false,
  "visible": false,
  "spriteMaskId": null,
  "persistent": false,
  "parentObjectId": {
    "name": "p_gui_button",
    "path": "objects/p_gui_button/p_gui_button.yy",
  },
  "physicsObject": false,
  "physicsSensor": false,
  "physicsShape": 1,
  "physicsGroup": 1,
  "physicsDensity": 0.5,
  "physicsRestitution": 0.1,
  "physicsLinearDamping": 0.1,
  "physicsAngularDamping": 0.1,
  "physicsFriction": 0.2,
  "physicsStartAwake": true,
  "physicsKinematic": false,
  "physicsShapePoints": [],
  "eventList": [
    {"isDnD":false,"eventNum":64,"eventType":8,"collisionObjectId":null,"parent":{"name":"obj_skill_block","path":"objects/obj_skill_block/obj_skill_block.yy",},"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
    {"isDnD":false,"eventNum":0,"eventType":0,"collisionObjectId":null,"parent":{"name":"obj_skill_block","path":"objects/obj_skill_block/obj_skill_block.yy",},"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
    {"isDnD":false,"eventNum":4,"eventType":7,"collisionObjectId":null,"parent":{"name":"obj_skill_block","path":"objects/obj_skill_block/obj_skill_block.yy",},"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
  ],
  "properties": [
    {"varType":2,"value":"placeholder title","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"text_title","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":4,"value":"[\"Item 0\", \"Item 1\", \"Item 2\"]","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[
        "\"Item 0\"",
        "\"Item 1\"",
        "\"Item 2\"",
      ],"multiselect":true,"filters":[],"resourceVersion":"1.0","name":"text_map","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":4,"value":"noone","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"player_character","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":4,"value":"[-1,-1,-1,-1]","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"skill_script_map","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":4,"value":"[-1,-1,-1,-1]","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"skill_inverse_script_map","tags":[],"resourceType":"GMObjectProperty",},
  ],
  "overriddenProperties": [
    {"propertyId":{"name":"activation_script","path":"objects/p_gui_button/p_gui_button.yy",},"objectId":{"name":"p_gui_button","path":"objects/p_gui_button/p_gui_button.yy",},"value":"scr_allocate_skill","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"alt_activation_script","path":"objects/p_gui_button/p_gui_button.yy",},"objectId":{"name":"p_gui_button","path":"objects/p_gui_button/p_gui_button.yy",},"value":"scr_deallocate_skill","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
  ],
  "parent": {
    "name": "skills",
    "path": "folders/Objects/ui/skills.yy",
  },
  "resourceVersion": "1.0",
  "name": "obj_skill_block",
  "tags": [],
  "resourceType": "GMObject",
}