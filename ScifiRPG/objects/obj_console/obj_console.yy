{
  "spriteId": {
    "name": "spr_console",
    "path": "sprites/spr_console/spr_console.yy",
  },
  "solid": false,
  "visible": true,
  "spriteMaskId": null,
  "persistent": false,
  "parentObjectId": {
    "name": "p_entity",
    "path": "objects/p_entity/p_entity.yy",
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
    {"isDnD":false,"eventNum":0,"eventType":2,"collisionObjectId":null,"parent":{"name":"obj_console","path":"objects/obj_console/obj_console.yy",},"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
  ],
  "properties": [
    {"varType":0,"value":"3","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"console_activation_time","tags":[],"resourceType":"GMObjectProperty",},
  ],
  "overriddenProperties": [
    {"propertyId":{"name":"entity_activate_script","path":"objects/p_entity/p_entity.yy",},"objectId":{"name":"p_entity","path":"objects/p_entity/p_entity.yy",},"value":"scr_activate_console","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"entity_activate_args","path":"objects/p_entity/p_entity.yy",},"objectId":{"name":"p_entity","path":"objects/p_entity/p_entity.yy",},"value":"[0]","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
  ],
  "parent": {
    "name": "terrain",
    "path": "folders/Objects/terrain.yy",
  },
  "resourceVersion": "1.0",
  "name": "obj_console",
  "tags": [],
  "resourceType": "GMObject",
}