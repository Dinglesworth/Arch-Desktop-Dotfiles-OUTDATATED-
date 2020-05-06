import dbus
import sys
try:
    med_player = 'org.mpris.MediaPlayer2.Player'
    session_bus = dbus.SessionBus()
    spotify_bus = session_bus.get_object(
        'org.mpris.MediaPlayer2.spotify',
        '/org/mpris/MediaPlayer2'
    )
    spotify_props = dbus.Interface(
        spotify_bus,
        'org.freedesktop.DBus.Properties'
    )
    stat = spotify_props.Get(med_player,'PlaybackStatus')
    if stat == "Playing":
        print('')
    else:
        print('')
except Exception as e:
    if isinstance(e, dbus.exceptions.DBusException):
        print('')
    else:
        print(e)
