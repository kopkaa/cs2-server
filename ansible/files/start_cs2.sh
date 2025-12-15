#!/bin/bash
# start_cs2.sh
MODE=${1:-deathmatch}  # default = deathmatch

# nastavení proměnných podle módu
case $MODE in
  deathmatch)
    GAME_TYPE=1
    GAME_MODE=2
    SKIRMISH=0
    MAP=de_dust2
    ;;
  casual)
    GAME_TYPE=0
    GAME_MODE=0
    SKIRMISH=0
    MAP=de_dust2
    ;;
  dangerzone)
    GAME_TYPE=6
    GAME_MODE=0
    SKIRMISH=0
    MAP=dz_blacksite
    ;;
  flyingscoutsman)
    GAME_TYPE=0
    GAME_MODE=0
    SKIRMISH=3
    MAP=de_dust2
    ;;
  *)
    echo "Unknown mode $MODE, defaulting to deathmatch"
    GAME_TYPE=1
    GAME_MODE=2
    SKIRMISH=0
    MAP=de_dust2
    ;;
esac

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/steam/cs2/game/bin/linuxsteamrt64
cd /home/steam/cs2/game/bin/linuxsteamrt64

./cs2 -dedicated +ip 0.0.0.0 +port 27015 \
       +game_type $GAME_TYPE +game_mode $GAME_MODE \
       +sv_skirmish_id $SKIRMISH +map $MAP +exec server.cfg
