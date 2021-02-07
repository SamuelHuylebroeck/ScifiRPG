{
  "spriteId": {
    "name": "spr_boss_frigate_missiles_projectile",
    "path": "sprites/spr_boss_frigate_missiles_projectile/spr_boss_frigate_missiles_projectile.yy",
  },
  "solid": false,
  "visible": true,
  "spriteMaskId": null,
  "persistent": false,
  "parentObjectId": {
    "name": "p_projectile",
    "path": "objects/p_projectile/p_projectile.yy",
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
    {"isDnD":false,"eventNum":0,"eventType":3,"collisionObjectId":null,"parent":{"name":"projectile_boss_missile","path":"objects/projectile_boss_missile/projectile_boss_missile.yy",},"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
    {"isDnD":false,"eventNum":0,"eventType":0,"collisionObjectId":null,"parent":{"name":"projectile_boss_missile","path":"objects/projectile_boss_missile/projectile_boss_missile.yy",},"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
    {"isDnD":false,"eventNum":2,"eventType":3,"collisionObjectId":null,"parent":{"name":"projectile_boss_missile","path":"objects/projectile_boss_missile/projectile_boss_missile.yy",},"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
  ],
  "properties": [
    {"varType":0,"value":"90","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"missile_inert_turn_rate","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":0,"value":"45","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"missile_firing_turn_rate","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":0,"value":"1","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"missile_inert_time","tags":[],"resourceType":"GMObjectProperty",},
    {"varType":5,"value":"so_missile_ignite","rangeEnabled":false,"rangeMin":0.0,"rangeMax":10.0,"listItems":[],"multiselect":false,"filters":[],"resourceVersion":"1.0","name":"missile_sfx_ignite","tags":[],"resourceType":"GMObjectProperty",},
  ],
  "overriddenProperties": [
    {"propertyId":{"name":"projectile_impact_player","path":"objects/p_projectile/p_projectile.yy",},"objectId":{"name":"p_projectile","path":"objects/p_projectile/p_projectile.yy",},"value":"True","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"projectile_damage","path":"objects/p_projectile/p_projectile.yy",},"objectId":{"name":"p_projectile","path":"objects/p_projectile/p_projectile.yy",},"value":"10","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"projectile_knockback","path":"objects/p_projectile/p_projectile.yy",},"objectId":{"name":"p_projectile","path":"objects/p_projectile/p_projectile.yy",},"value":"5","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"projectile_impact_sprite","path":"objects/p_projectile/p_projectile.yy",},"objectId":{"name":"p_projectile","path":"objects/p_projectile/p_projectile.yy",},"value":"spr_boss_frigate_missiles_explosion","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"projectile_lifetime","path":"objects/p_projectile/p_projectile.yy",},"objectId":{"name":"p_projectile","path":"objects/p_projectile/p_projectile.yy",},"value":"5","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"projectile_speed","path":"objects/p_projectile/p_projectile.yy",},"objectId":{"name":"p_projectile","path":"objects/p_projectile/p_projectile.yy",},"value":"1.5","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"projectile_hit_script","path":"objects/p_projectile/p_projectile.yy",},"objectId":{"name":"p_projectile","path":"objects/p_projectile/p_projectile.yy",},"value":"scr_explode_projectile","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"projectile_stagger","path":"objects/p_projectile/p_projectile.yy",},"objectId":{"name":"p_projectile","path":"objects/p_projectile/p_projectile.yy",},"value":"False","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"projectile_impact_sfx","path":"objects/p_projectile/p_projectile.yy",},"objectId":{"name":"p_projectile","path":"objects/p_projectile/p_projectile.yy",},"value":"so_gunner_projectile_explosion","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
  ],
  "parent": {
    "name": "projectiles",
    "path": "folders/Objects/enemies/projectiles.yy",
  },
  "resourceVersion": "1.0",
  "name": "projectile_boss_missile",
  "tags": [],
  "resourceType": "GMObject",
}