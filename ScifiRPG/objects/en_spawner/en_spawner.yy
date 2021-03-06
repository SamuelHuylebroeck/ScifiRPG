{
  "spriteId": {
    "name": "spr_spawner_idle_relax",
    "path": "sprites/spr_spawner_idle_relax/spr_spawner_idle_relax.yy",
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
    {"isDnD":false,"eventNum":0,"eventType":0,"collisionObjectId":null,"parent":{"name":"en_spawner","path":"objects/en_spawner/en_spawner.yy",},"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
    {"isDnD":false,"eventNum":0,"eventType":3,"collisionObjectId":null,"parent":{"name":"en_spawner","path":"objects/en_spawner/en_spawner.yy",},"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
  ],
  "properties": [
    {"varType":5,"value":"path_patrol_debug","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"spawner_patrol_path","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":1,"value":"1","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"spawner_limit","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":0,"value":"5","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"spawn_cooldown","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":1,"value":"15","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"spawner_anim_spawn_frame","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":5,"value":"-1","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"spawner_unit_type","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":0,"value":"5","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"spawner_xp_giving_units","tags":[],"resourceType":"GMObjectProperty",},
  ],
  "overriddenProperties": [],
  "parent": {
    "name": "enemies",
    "path": "folders/Objects/enemies.yy",
  },
  "resourceVersion": "1.0",
  "name": "en_spawner",
  "tags": [],
  "resourceType": "GMObject",
}