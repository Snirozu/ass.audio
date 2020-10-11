package grig.audio;

@:forward
abstract AudioBuffer(AudioBufferImpl)
{
    public var sampleRate(get, never):Float;
    public var numChannels(get, never):Int;
    public var numSamples(get, never):Int;

    private inline function get_sampleRate():Float
    {
        return this.getSampleRate();
    }

    private inline function get_numChannels():Int
    {
        return this.getNumChannels();
    }

    private inline function get_numSamples():Int
    {
        return this.getNumSamples();
    }

    public inline function new(buffer:AudioBufferImpl)
    {
        this = buffer;
    }

    @:arrayAccess
    public inline function get(i:Int):AudioChannel
    {
        return new AudioChannel(this.getChannel(i));
    }
}