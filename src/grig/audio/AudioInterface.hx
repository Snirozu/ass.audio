package grig.audio;

#if heaps // we need to override if making a plugin or if the user forces override
typedef AudioInterface = NativeChannelAudioInterface;
#elseif (js && !nodejs)
typedef AudioInterface = grig.audio.js.webaudio.AudioInterface;
#elseif cpp
typedef AudioInterface = grig.audio.cpp.PAAudioInterface;
#else

extern class AudioInterface
{
    public var isOpen(default, null):Bool = false;

    public function new(api:grig.audio.Api = grig.audio.Api.Undefined);
    public static function getApis():Array<grig.audio.Api>;
    public function getPorts():Array<PortInfo>;
    public function openPort(options:AudioInterfaceOptions):Surprise<AudioInterface, tink.core.Error>;
    public function closePort():Void;
    public function setCallback(_audioCallback:AudioCallback):Void;
    public function cancelCallback():Void;
}

#end