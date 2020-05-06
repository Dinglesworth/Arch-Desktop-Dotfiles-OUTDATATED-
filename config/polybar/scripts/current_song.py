import dbus
import sys

try:
    med_player = 'org.mpris.MediaPlayer2.Player'

    def string_mkr(x):
        if sys.version_info.major == 3:
            return x
        else:
            return x.encode('utf-8')

    session_bus = dbus.SessionBus()
    spotify_bus = session_bus.get_object(
        'org.mpris.MediaPlayer2.spotify',
        '/org/mpris/MediaPlayer2'
    )
    spotify_props = dbus.Interface(
        spotify_bus,
        'org.freedesktop.DBus.Properties'
    )
    meta = spotify_props.Get(med_player,'Metadata')
    stat = spotify_props.Get(med_player,'PlaybackStatus')
    artist = string_mkr(meta['xesam:artist'][0])
    song = string_mkr(meta['xesam:title']).split('(')[0]
    if artist == "":
        print(song)
    else:
        print(artist+":",song)

except Exception as e:
    if isinstance(e, dbus.exceptions.DBusException):
        print('')
    else:
        print(e)
