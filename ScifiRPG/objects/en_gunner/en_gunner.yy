{
  "spriteId": {
    "name": "spr_gunner_idle",
    "path": "sprites/spr_gunner_idle/spr_gunner_idle.yy",
  },
  "solid": false,
  "visible": true,
  "spriteMaskId": null,
  "persistent": false,
  "parentObjectId": {
    "name": "p_enemy",
    "path": "objects/p_enemy/p_enemy.yy",
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
    {"isDnD":false,"eventNum":0,"eventType":0,"collisionObjectId":null,"parent":{"name":"en_gunner","path":"objects/en_gunner/en_gunner.yy",},"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
    {"isDnD":false,"eventNum":0,"eventType":3,"collisionObjectId":null,"parent":{"name":"en_gunner","path":"objects/en_gunner/en_gunner.yy",},"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
  ],
  "properties": [
    {"varType":0,"value":"64","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"gunner_retreat_range","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":0,"value":"96","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"gunner_hold_range","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":0,"value":"60","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"gunner_shooting_turn_rate","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":0,"value":"1","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"gunner_shot_cooldown","tags":[],"resourceType":"GMObjectProperty",},
  ],
  "overriddenProperties": [
    {"propertyId":{"name":"entity_collision","path":"objects/p_entity/p_entity.yy",},"objectId":{"name":"p_entity","path":"objects/p_entity/p_entity.yy",},"value":"True","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"enemy_max_hp","path":"objects/p_enemy/p_enemy.yy",},"objectId":{"name":"p_enemy","path":"objects/p_enemy/p_enemy.yy",},"value":"20","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"enemy_attack_radius","path":"objects/p_enemy/p_enemy.yy",},"objectId":{"name":"p_enemy","path":"objects/p_enemy/p_enemy.yy",},"value":"128","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"enemy_move_angle_tolerance","path":"objects/p_enemy/p_enemy.yy",},"objectId":{"name":"p_enemy","path":"objects/p_enemy/p_enemy.yy",},"value":"10","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"enemy_aggro_radius","path":"objects/p_enemy/p_enemy.yy",},"objectId":{"name":"p_enemy","path":"objects/p_enemy/p_enemy.yy",},"value":"96","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"enemy_turn_rate","path":"objects/p_enemy/p_enemy.yy",},"objectId":{"name":"p_enemy","path":"objects/p_enemy/p_enemy.yy",},"value":"120","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"enemy_sfx_aggro","path":"objects/p_enemy/p_enemy.yy",},"objectId":{"name":"p_enemy","path":"objects/p_enemy/p_enemy.yy",},"value":"so_gunner_aggro","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"enemy_sfx_death","path":"objects/p_enemy/p_enemy.yy",},"objectId":{"name":"p_enemy","path":"objects/p_enemy/p_enemy.yy",},"value":"so_gunner_death","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"enemy_sfx_attack","path":"objects/p_enemy/p_enemy.yy",},"objectId":{"name":"p_enemy","path":"objects/p_enemy/p_enemy.yy",},"value":"so_gunner_shoot","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
  ],
  "parent": {
    "name": "enemies",
    "path": "folders/Objects/enemies.yy",
  },
  "resourceVersion": "1.0",
  "name": "en_gunner",
  "tags": [],
  "resourceType": "GMObject",
}