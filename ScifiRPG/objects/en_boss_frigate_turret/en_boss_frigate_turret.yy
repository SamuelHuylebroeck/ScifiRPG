{
  "spriteId": {
    "name": "spr_boss_frigate_turret",
    "path": "sprites/spr_boss_frigate_turret/spr_boss_frigate_turret.yy",
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
    {"isDnD":false,"eventNum":0,"eventType":0,"collisionObjectId":null,"parent":{"name":"en_boss_frigate_turret","path":"objects/en_boss_frigate_turret/en_boss_frigate_turret.yy",},"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
    {"isDnD":false,"eventNum":0,"eventType":3,"collisionObjectId":null,"parent":{"name":"en_boss_frigate_turret","path":"objects/en_boss_frigate_turret/en_boss_frigate_turret.yy",},"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
    {"isDnD":false,"eventNum":0,"eventType":12,"collisionObjectId":null,"parent":{"name":"en_boss_frigate_turret","path":"objects/en_boss_frigate_turret/en_boss_frigate_turret.yy",},"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
  ],
  "properties": [
    {"varType":0,"value":"1","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"turret_shot_cooldown","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":0,"value":"0.25","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"turret_shot_cooldown_jitter","tags":[],"resourceType":"GMObjectProperty",},
  ],
  "overriddenProperties": [
    {"propertyId":{"name":"enemy_max_hp","path":"objects/p_enemy/p_enemy.yy",},"objectId":{"name":"p_enemy","path":"objects/p_enemy/p_enemy.yy",},"value":"25","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"enemy_state_default","path":"objects/p_enemy/p_enemy.yy",},"objectId":{"name":"p_enemy","path":"objects/p_enemy/p_enemy.yy",},"value":"ENEMY_STATE.IDLE","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"enemy_can_be_staggered","path":"objects/p_enemy/p_enemy.yy",},"objectId":{"name":"p_enemy","path":"objects/p_enemy/p_enemy.yy",},"value":"False","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"enemy_sfx_attack","path":"objects/p_enemy/p_enemy.yy",},"objectId":{"name":"p_enemy","path":"objects/p_enemy/p_enemy.yy",},"value":"so_gunner_shoot","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"enemy_attack_radius","path":"objects/p_enemy/p_enemy.yy",},"objectId":{"name":"p_enemy","path":"objects/p_enemy/p_enemy.yy",},"value":"128","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"enemy_apply_tile_collision","path":"objects/p_enemy/p_enemy.yy",},"objectId":{"name":"p_enemy","path":"objects/p_enemy/p_enemy.yy",},"value":"False","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
  ],
  "parent": {
    "name": "enemies",
    "path": "folders/Objects/enemies.yy",
  },
  "resourceVersion": "1.0",
  "name": "en_boss_frigate_turret",
  "tags": [],
  "resourceType": "GMObject",
}