% Generated Code Do Not Modify
% package javax.microedition.khronos.opengles
% import java.nio.Buffer
% import java.nio.FloatBuffer
% import java.nio.IntBuffer

-module('GL10').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% Java interface

'$handle_undefined_function'(Function, Arguments) ->
    apply('GL', Function, Arguments).

static_init() ->
    put({?MODULE, 'GL_ADD'}, 260),
    put({?MODULE, 'GL_ALIASED_LINE_WIDTH_RANGE'}, 33902),
    put({?MODULE, 'GL_ALIASED_POINT_SIZE_RANGE'}, 33901),
    put({?MODULE, 'GL_ALPHA'}, 6406),
    put({?MODULE, 'GL_ALPHA_BITS'}, 3413),
    put({?MODULE, 'GL_ALPHA_TEST'}, 3008),
    put({?MODULE, 'GL_ALWAYS'}, 519),
    put({?MODULE, 'GL_AMBIENT'}, 4608),
    put({?MODULE, 'GL_AMBIENT_AND_DIFFUSE'}, 5634),
    put({?MODULE, 'GL_AND'}, 5377),
    put({?MODULE, 'GL_AND_INVERTED'}, 5380),
    put({?MODULE, 'GL_AND_REVERSE'}, 5378),
    put({?MODULE, 'GL_BACK'}, 1029),
    put({?MODULE, 'GL_BLEND'}, 3042),
    put({?MODULE, 'GL_BLUE_BITS'}, 3412),
    put({?MODULE, 'GL_BYTE'}, 5120),
    put({?MODULE, 'GL_CCW'}, 2305),
    put({?MODULE, 'GL_CLAMP_TO_EDGE'}, 33071),
    put({?MODULE, 'GL_CLEAR'}, 5376),
    put({?MODULE, 'GL_COLOR_ARRAY'}, 32886),
    put({?MODULE, 'GL_COLOR_BUFFER_BIT'}, 16384),
    put({?MODULE, 'GL_COLOR_LOGIC_OP'}, 3058),
    put({?MODULE, 'GL_COLOR_MATERIAL'}, 2903),
    put({?MODULE, 'GL_COMPRESSED_TEXTURE_FORMATS'}, 34467),
    put({?MODULE, 'GL_CONSTANT_ATTENUATION'}, 4615),
    put({?MODULE, 'GL_COPY'}, 5379),
    put({?MODULE, 'GL_COPY_INVERTED'}, 5388),
    put({?MODULE, 'GL_CULL_FACE'}, 2884),
    put({?MODULE, 'GL_CW'}, 2304),
    put({?MODULE, 'GL_DECAL'}, 8449),
    put({?MODULE, 'GL_DECR'}, 7683),
    put({?MODULE, 'GL_DEPTH_BITS'}, 3414),
    put({?MODULE, 'GL_DEPTH_BUFFER_BIT'}, 256),
    put({?MODULE, 'GL_DEPTH_TEST'}, 2929),
    put({?MODULE, 'GL_DIFFUSE'}, 4609),
    put({?MODULE, 'GL_DITHER'}, 3024),
    put({?MODULE, 'GL_DONT_CARE'}, 4352),
    put({?MODULE, 'GL_DST_ALPHA'}, 772),
    put({?MODULE, 'GL_DST_COLOR'}, 774),
    put({?MODULE, 'GL_EMISSION'}, 5632),
    put({?MODULE, 'GL_EQUAL'}, 514),
    put({?MODULE, 'GL_EQUIV'}, 5385),
    put({?MODULE, 'GL_EXP'}, 2048),
    put({?MODULE, 'GL_EXP2'}, 2049),
    put({?MODULE, 'GL_EXTENSIONS'}, 7939),
    put({?MODULE, 'GL_FALSE'}, 0),
    put({?MODULE, 'GL_FASTEST'}, 4353),
    put({?MODULE, 'GL_FIXED'}, 5132),
    put({?MODULE, 'GL_FLAT'}, 7424),
    put({?MODULE, 'GL_FLOAT'}, 5126),
    put({?MODULE, 'GL_FOG'}, 2912),
    put({?MODULE, 'GL_FOG_COLOR'}, 2918),
    put({?MODULE, 'GL_FOG_DENSITY'}, 2914),
    put({?MODULE, 'GL_FOG_END'}, 2916),
    put({?MODULE, 'GL_FOG_HINT'}, 3156),
    put({?MODULE, 'GL_FOG_MODE'}, 2917),
    put({?MODULE, 'GL_FOG_START'}, 2915),
    put({?MODULE, 'GL_FRONT'}, 1028),
    put({?MODULE, 'GL_FRONT_AND_BACK'}, 1032),
    put({?MODULE, 'GL_GEQUAL'}, 518),
    put({?MODULE, 'GL_GREATER'}, 516),
    put({?MODULE, 'GL_GREEN_BITS'}, 3411),
    put({?MODULE, 'GL_IMPLEMENTATION_COLOR_READ_FORMAT_OES'}, 35739),
    put({?MODULE, 'GL_IMPLEMENTATION_COLOR_READ_TYPE_OES'}, 35738),
    put({?MODULE, 'GL_INCR'}, 7682),
    put({?MODULE, 'GL_INVALID_ENUM'}, 1280),
    put({?MODULE, 'GL_INVALID_OPERATION'}, 1282),
    put({?MODULE, 'GL_INVALID_VALUE'}, 1281),
    put({?MODULE, 'GL_INVERT'}, 5386),
    put({?MODULE, 'GL_KEEP'}, 7680),
    put({?MODULE, 'GL_LEQUAL'}, 515),
    put({?MODULE, 'GL_LESS'}, 513),
    put({?MODULE, 'GL_LIGHT_MODEL_AMBIENT'}, 2899),
    put({?MODULE, 'GL_LIGHT_MODEL_TWO_SIDE'}, 2898),
    put({?MODULE, 'GL_LIGHT0'}, 16384),
    put({?MODULE, 'GL_LIGHT1'}, 16385),
    put({?MODULE, 'GL_LIGHT2'}, 16386),
    put({?MODULE, 'GL_LIGHT3'}, 16387),
    put({?MODULE, 'GL_LIGHT4'}, 16388),
    put({?MODULE, 'GL_LIGHT5'}, 16389),
    put({?MODULE, 'GL_LIGHT6'}, 16390),
    put({?MODULE, 'GL_LIGHT7'}, 16391),
    put({?MODULE, 'GL_LIGHTING'}, 2896),
    put({?MODULE, 'GL_LINE_LOOP'}, 2),
    put({?MODULE, 'GL_LINE_SMOOTH'}, 2848),
    put({?MODULE, 'GL_LINE_SMOOTH_HINT'}, 3154),
    put({?MODULE, 'GL_LINE_STRIP'}, 3),
    put({?MODULE, 'GL_LINEAR'}, 9729),
    put({?MODULE, 'GL_LINEAR_ATTENUATION'}, 4616),
    put({?MODULE, 'GL_LINEAR_MIPMAP_LINEAR'}, 9987),
    put({?MODULE, 'GL_LINEAR_MIPMAP_NEAREST'}, 9985),
    put({?MODULE, 'GL_LINES'}, 1),
    put({?MODULE, 'GL_LUMINANCE'}, 6409),
    put({?MODULE, 'GL_LUMINANCE_ALPHA'}, 6410),
    put({?MODULE, 'GL_MAX_ELEMENTS_INDICES'}, 33001),
    put({?MODULE, 'GL_MAX_ELEMENTS_VERTICES'}, 33000),
    put({?MODULE, 'GL_MAX_LIGHTS'}, 3377),
    put({?MODULE, 'GL_MAX_MODELVIEW_STACK_DEPTH'}, 3382),
    put({?MODULE, 'GL_MAX_PROJECTION_STACK_DEPTH'}, 3384),
    put({?MODULE, 'GL_MAX_TEXTURE_SIZE'}, 3379),
    put({?MODULE, 'GL_MAX_TEXTURE_STACK_DEPTH'}, 3385),
    put({?MODULE, 'GL_MAX_TEXTURE_UNITS'}, 34018),
    put({?MODULE, 'GL_MAX_VIEWPORT_DIMS'}, 3386),
    put({?MODULE, 'GL_MODELVIEW'}, 5888),
    put({?MODULE, 'GL_MODULATE'}, 8448),
    put({?MODULE, 'GL_MULTISAMPLE'}, 32925),
    put({?MODULE, 'GL_NAND'}, 5390),
    put({?MODULE, 'GL_NEAREST'}, 9728),
    put({?MODULE, 'GL_NEAREST_MIPMAP_LINEAR'}, 9986),
    put({?MODULE, 'GL_NEAREST_MIPMAP_NEAREST'}, 9984),
    put({?MODULE, 'GL_NEVER'}, 512),
    put({?MODULE, 'GL_NICEST'}, 4354),
    put({?MODULE, 'GL_NO_ERROR'}, 0),
    put({?MODULE, 'GL_NOOP'}, 5381),
    put({?MODULE, 'GL_NOR'}, 5384),
    put({?MODULE, 'GL_NORMAL_ARRAY'}, 32885),
    put({?MODULE, 'GL_NORMALIZE'}, 2977),
    put({?MODULE, 'GL_NOTEQUAL'}, 517),
    put({?MODULE, 'GL_NUM_COMPRESSED_TEXTURE_FORMATS'}, 34466),
    put({?MODULE, 'GL_ONE'}, 1),
    put({?MODULE, 'GL_ONE_MINUS_DST_ALPHA'}, 773),
    put({?MODULE, 'GL_ONE_MINUS_DST_COLOR'}, 775),
    put({?MODULE, 'GL_ONE_MINUS_SRC_ALPHA'}, 771),
    put({?MODULE, 'GL_ONE_MINUS_SRC_COLOR'}, 769),
    put({?MODULE, 'GL_OR'}, 5383),
    put({?MODULE, 'GL_OR_INVERTED'}, 5389),
    put({?MODULE, 'GL_OR_REVERSE'}, 5387),
    put({?MODULE, 'GL_OUT_OF_MEMORY'}, 1285),
    put({?MODULE, 'GL_PACK_ALIGNMENT'}, 3333),
    put({?MODULE, 'GL_PALETTE4_R5_G6_B5_OES'}, 35730),
    put({?MODULE, 'GL_PALETTE4_RGB5_A1_OES'}, 35732),
    put({?MODULE, 'GL_PALETTE4_RGB8_OES'}, 35728),
    put({?MODULE, 'GL_PALETTE4_RGBA4_OES'}, 35731),
    put({?MODULE, 'GL_PALETTE4_RGBA8_OES'}, 35729),
    put({?MODULE, 'GL_PALETTE8_R5_G6_B5_OES'}, 35735),
    put({?MODULE, 'GL_PALETTE8_RGB5_A1_OES'}, 35737),
    put({?MODULE, 'GL_PALETTE8_RGB8_OES'}, 35733),
    put({?MODULE, 'GL_PALETTE8_RGBA4_OES'}, 35736),
    put({?MODULE, 'GL_PALETTE8_RGBA8_OES'}, 35734),
    put({?MODULE, 'GL_PERSPECTIVE_CORRECTION_HINT'}, 3152),
    put({?MODULE, 'GL_POINT_SMOOTH'}, 2832),
    put({?MODULE, 'GL_POINT_SMOOTH_HINT'}, 3153),
    put({?MODULE, 'GL_POINTS'}, 0),
    put({?MODULE, 'GL_POINT_FADE_THRESHOLD_SIZE'}, 33064),
    put({?MODULE, 'GL_POINT_SIZE'}, 2833),
    put({?MODULE, 'GL_POLYGON_OFFSET_FILL'}, 32823),
    put({?MODULE, 'GL_POLYGON_SMOOTH_HINT'}, 3155),
    put({?MODULE, 'GL_POSITION'}, 4611),
    put({?MODULE, 'GL_PROJECTION'}, 5889),
    put({?MODULE, 'GL_QUADRATIC_ATTENUATION'}, 4617),
    put({?MODULE, 'GL_RED_BITS'}, 3410),
    put({?MODULE, 'GL_RENDERER'}, 7937),
    put({?MODULE, 'GL_REPEAT'}, 10497),
    put({?MODULE, 'GL_REPLACE'}, 7681),
    put({?MODULE, 'GL_RESCALE_NORMAL'}, 32826),
    put({?MODULE, 'GL_RGB'}, 6407),
    put({?MODULE, 'GL_RGBA'}, 6408),
    put({?MODULE, 'GL_SAMPLE_ALPHA_TO_COVERAGE'}, 32926),
    put({?MODULE, 'GL_SAMPLE_ALPHA_TO_ONE'}, 32927),
    put({?MODULE, 'GL_SAMPLE_COVERAGE'}, 32928),
    put({?MODULE, 'GL_SCISSOR_TEST'}, 3089),
    put({?MODULE, 'GL_SET'}, 5391),
    put({?MODULE, 'GL_SHININESS'}, 5633),
    put({?MODULE, 'GL_SHORT'}, 5122),
    put({?MODULE, 'GL_SMOOTH'}, 7425),
    put({?MODULE, 'GL_SMOOTH_LINE_WIDTH_RANGE'}, 2850),
    put({?MODULE, 'GL_SMOOTH_POINT_SIZE_RANGE'}, 2834),
    put({?MODULE, 'GL_SPECULAR'}, 4610),
    put({?MODULE, 'GL_SPOT_CUTOFF'}, 4614),
    put({?MODULE, 'GL_SPOT_DIRECTION'}, 4612),
    put({?MODULE, 'GL_SPOT_EXPONENT'}, 4613),
    put({?MODULE, 'GL_SRC_ALPHA'}, 770),
    put({?MODULE, 'GL_SRC_ALPHA_SATURATE'}, 776),
    put({?MODULE, 'GL_SRC_COLOR'}, 768),
    put({?MODULE, 'GL_STACK_OVERFLOW'}, 1283),
    put({?MODULE, 'GL_STACK_UNDERFLOW'}, 1284),
    put({?MODULE, 'GL_STENCIL_BITS'}, 3415),
    put({?MODULE, 'GL_STENCIL_BUFFER_BIT'}, 1024),
    put({?MODULE, 'GL_STENCIL_TEST'}, 2960),
    put({?MODULE, 'GL_SUBPIXEL_BITS'}, 3408),
    put({?MODULE, 'GL_TEXTURE'}, 5890),
    put({?MODULE, 'GL_TEXTURE_2D'}, 3553),
    put({?MODULE, 'GL_TEXTURE_COORD_ARRAY'}, 32888),
    put({?MODULE, 'GL_TEXTURE_ENV'}, 8960),
    put({?MODULE, 'GL_TEXTURE_ENV_COLOR'}, 8705),
    put({?MODULE, 'GL_TEXTURE_ENV_MODE'}, 8704),
    put({?MODULE, 'GL_TEXTURE_MAG_FILTER'}, 10240),
    put({?MODULE, 'GL_TEXTURE_MIN_FILTER'}, 10241),
    put({?MODULE, 'GL_TEXTURE_WRAP_S'}, 10242),
    put({?MODULE, 'GL_TEXTURE_WRAP_T'}, 10243),
    put({?MODULE, 'GL_TEXTURE0'}, 33984),
    put({?MODULE, 'GL_TEXTURE1'}, 33985),
    put({?MODULE, 'GL_TEXTURE2'}, 33986),
    put({?MODULE, 'GL_TEXTURE3'}, 33987),
    put({?MODULE, 'GL_TEXTURE4'}, 33988),
    put({?MODULE, 'GL_TEXTURE5'}, 33989),
    put({?MODULE, 'GL_TEXTURE6'}, 33990),
    put({?MODULE, 'GL_TEXTURE7'}, 33991),
    put({?MODULE, 'GL_TEXTURE8'}, 33992),
    put({?MODULE, 'GL_TEXTURE9'}, 33993),
    put({?MODULE, 'GL_TEXTURE10'}, 33994),
    put({?MODULE, 'GL_TEXTURE11'}, 33995),
    put({?MODULE, 'GL_TEXTURE12'}, 33996),
    put({?MODULE, 'GL_TEXTURE13'}, 33997),
    put({?MODULE, 'GL_TEXTURE14'}, 33998),
    put({?MODULE, 'GL_TEXTURE15'}, 33999),
    put({?MODULE, 'GL_TEXTURE16'}, 34000),
    put({?MODULE, 'GL_TEXTURE17'}, 34001),
    put({?MODULE, 'GL_TEXTURE18'}, 34002),
    put({?MODULE, 'GL_TEXTURE19'}, 34003),
    put({?MODULE, 'GL_TEXTURE20'}, 34004),
    put({?MODULE, 'GL_TEXTURE21'}, 34005),
    put({?MODULE, 'GL_TEXTURE22'}, 34006),
    put({?MODULE, 'GL_TEXTURE23'}, 34007),
    put({?MODULE, 'GL_TEXTURE24'}, 34008),
    put({?MODULE, 'GL_TEXTURE25'}, 34009),
    put({?MODULE, 'GL_TEXTURE26'}, 34010),
    put({?MODULE, 'GL_TEXTURE27'}, 34011),
    put({?MODULE, 'GL_TEXTURE28'}, 34012),
    put({?MODULE, 'GL_TEXTURE29'}, 34013),
    put({?MODULE, 'GL_TEXTURE30'}, 34014),
    put({?MODULE, 'GL_TEXTURE31'}, 34015),
    put({?MODULE, 'GL_TRIANGLE_FAN'}, 6),
    put({?MODULE, 'GL_TRIANGLE_STRIP'}, 5),
    put({?MODULE, 'GL_TRIANGLES'}, 4),
    put({?MODULE, 'GL_TRUE'}, 1),
    put({?MODULE, 'GL_UNPACK_ALIGNMENT'}, 3317),
    put({?MODULE, 'GL_UNSIGNED_BYTE'}, 5121),
    put({?MODULE, 'GL_UNSIGNED_SHORT'}, 5123),
    put({?MODULE, 'GL_UNSIGNED_SHORT_4_4_4_4'}, 32819),
    put({?MODULE, 'GL_UNSIGNED_SHORT_5_5_5_1'}, 32820),
    put({?MODULE, 'GL_UNSIGNED_SHORT_5_6_5'}, 33635),
    put({?MODULE, 'GL_VENDOR'}, 7936),
    put({?MODULE, 'GL_VERSION'}, 7938),
    put({?MODULE, 'GL_VERTEX_ARRAY'}, 32884),
    put({?MODULE, 'GL_XOR'}, 5382),
    put({?MODULE, 'GL_ZERO'}, 0),
    ok.


glActiveTexture(This, Texture) when is_integer(Texture) ->
    erlang:error({abstract_method, glActiveTexture}).

glAlphaFunc(This, Func, Ref) when is_integer(Func), is_number(Ref) ->
    erlang:error({abstract_method, glAlphaFunc}).

glBindTexture(This, Target, Texture) when is_integer(Target), is_integer(Texture) ->
    erlang:error({abstract_method, glBindTexture}).

glBlendFunc(This, Sfactor, Dfactor) when is_integer(Sfactor), is_integer(Dfactor) ->
    erlang:error({abstract_method, glBlendFunc}).

glClear(This, Mask) when is_integer(Mask) ->
    erlang:error({abstract_method, glClear}).

glClearColor(This, Red, Green, Blue, Alpha) when is_number(Red), is_number(Green), is_number(Blue), is_number(Alpha) ->
    erlang:error({abstract_method, glClearColor}).

glClearDepthf(This, Depth) when is_number(Depth) ->
    erlang:error({abstract_method, glClearDepthf}).

glClearStencil(This, S) when is_integer(S) ->
    erlang:error({abstract_method, glClearStencil}).

glClientActiveTexture(This, Texture) when is_integer(Texture) ->
    erlang:error({abstract_method, glClientActiveTexture}).

glColor4f(This, Red, Green, Blue, Alpha) when is_number(Red), is_number(Green), is_number(Blue), is_number(Alpha) ->
    erlang:error({abstract_method, glColor4f}).

glColorMask(This, Red, Green, Blue, Alpha) when is_boolean(Red), is_boolean(Green), is_boolean(Blue), is_boolean(Alpha) ->
    erlang:error({abstract_method, glColorMask}).

glColorPointer(This, Size, Type, Stride, Pointer) when is_integer(Size), is_integer(Type), is_integer(Stride) ->
    erlang:error({abstract_method, glColorPointer}).

glCompressedTexImage2D(This, Target, Level, Internalformat, Width, Height, Border, ImageSize, Data) when is_integer(Target), is_integer(Level), is_integer(Internalformat), is_integer(Width), is_integer(Height), is_integer(Border), is_integer(ImageSize) ->
    erlang:error({abstract_method, glCompressedTexImage2D}).

glCompressedTexSubImage2D(This, Target, Level, Xoffset, Yoffset, Width, Height, Format, ImageSize, Data) when is_integer(Target), is_integer(Level), is_integer(Xoffset), is_integer(Yoffset), is_integer(Width), is_integer(Height), is_integer(Format), is_integer(ImageSize) ->
    erlang:error({abstract_method, glCompressedTexSubImage2D}).

glCopyTexImage2D(This, Target, Level, Internalformat, X, Y, Width, Height, Border) when is_integer(Target), is_integer(Level), is_integer(Internalformat), is_integer(X), is_integer(Y), is_integer(Width), is_integer(Height), is_integer(Border) ->
    erlang:error({abstract_method, glCopyTexImage2D}).

glCopyTexSubImage2D(This, Target, Level, Xoffset, Yoffset, X, Y, Width, Height) when is_integer(Target), is_integer(Level), is_integer(Xoffset), is_integer(Yoffset), is_integer(X), is_integer(Y), is_integer(Width), is_integer(Height) ->
    erlang:error({abstract_method, glCopyTexSubImage2D}).

glCullFace(This, Mode) when is_integer(Mode) ->
    erlang:error({abstract_method, glCullFace}).

glDeleteTextures(This, N, Textures, Offset) when is_integer(N), (is_tuple(Textures) orelse Textures =:= undefined), is_integer(Offset) ->
    erlang:error({abstract_method, glDeleteTextures}).

glDeleteTextures(This, N, Textures) when is_integer(N) ->
    erlang:error({abstract_method, glDeleteTextures}).

glDepthFunc(This, Func) when is_integer(Func) ->
    erlang:error({abstract_method, glDepthFunc}).

glDepthMask(This, Flag) when is_boolean(Flag) ->
    erlang:error({abstract_method, glDepthMask}).

glDepthRangef(This, ZNear, ZFar) when is_number(ZNear), is_number(ZFar) ->
    erlang:error({abstract_method, glDepthRangef}).

glDisable(This, Cap) when is_integer(Cap) ->
    erlang:error({abstract_method, glDisable}).

glDisableClientState(This, Array) when is_integer(Array) ->
    erlang:error({abstract_method, glDisableClientState}).

glDrawArrays(This, Mode, First, Count) when is_integer(Mode), is_integer(First), is_integer(Count) ->
    erlang:error({abstract_method, glDrawArrays}).

glDrawElements(This, Mode, Count, Type, Indices) when is_integer(Mode), is_integer(Count), is_integer(Type) ->
    erlang:error({abstract_method, glDrawElements}).

glEnable(This, Cap) when is_integer(Cap) ->
    erlang:error({abstract_method, glEnable}).

glEnableClientState(This, Array) when is_integer(Array) ->
    erlang:error({abstract_method, glEnableClientState}).

glFinish(This) ->
    erlang:error({abstract_method, glFinish}).

glFlush(This) ->
    erlang:error({abstract_method, glFlush}).

glFogf(This, Pname, Param) when is_integer(Pname), is_number(Param) ->
    erlang:error({abstract_method, glFogf}).

glFogfv(This, Pname, Params, Offset) when is_integer(Pname), (is_tuple(Params) orelse Params =:= undefined), is_integer(Offset) ->
    erlang:error({abstract_method, glFogfv}).

glFogfv(This, Pname, Params) when is_integer(Pname) ->
    erlang:error({abstract_method, glFogfv}).

glFrontFace(This, Mode) when is_integer(Mode) ->
    erlang:error({abstract_method, glFrontFace}).

glFrustumf(This, Left, Right, Bottom, Top, ZNear, ZFar) when is_number(Left), is_number(Right), is_number(Bottom), is_number(Top), is_number(ZNear), is_number(ZFar) ->
    erlang:error({abstract_method, glFrustumf}).

glGenTextures(This, N, Textures, Offset) when is_integer(N), (is_tuple(Textures) orelse Textures =:= undefined), is_integer(Offset) ->
    erlang:error({abstract_method, glGenTextures}).

glGenTextures(This, N, Textures) when is_integer(N) ->
    erlang:error({abstract_method, glGenTextures}).

glGetError(This) ->
    erlang:error({abstract_method, glGetError}).

glGetIntegerv(This, Pname, Params, Offset) when is_integer(Pname), (is_tuple(Params) orelse Params =:= undefined), is_integer(Offset) ->
    erlang:error({abstract_method, glGetIntegerv}).

glGetIntegerv(This, Pname, Params) when is_integer(Pname) ->
    erlang:error({abstract_method, glGetIntegerv}).

glGetString(This, Name) when is_integer(Name) ->
    erlang:error({abstract_method, glGetString}).

glHint(This, Target, Mode) when is_integer(Target), is_integer(Mode) ->
    erlang:error({abstract_method, glHint}).

glLightModelf(This, Pname, Param) when is_integer(Pname), is_number(Param) ->
    erlang:error({abstract_method, glLightModelf}).

glLightModelfv(This, Pname, Params, Offset) when is_integer(Pname), (is_tuple(Params) orelse Params =:= undefined), is_integer(Offset) ->
    erlang:error({abstract_method, glLightModelfv}).

glLightModelfv(This, Pname, Params) when is_integer(Pname) ->
    erlang:error({abstract_method, glLightModelfv}).

glLightf(This, Light, Pname, Param) when is_integer(Light), is_integer(Pname), is_number(Param) ->
    erlang:error({abstract_method, glLightf}).

glLightfv(This, Light, Pname, Params, Offset) when is_integer(Light), is_integer(Pname), (is_tuple(Params) orelse Params =:= undefined), is_integer(Offset) ->
    erlang:error({abstract_method, glLightfv}).

glLightfv(This, Light, Pname, Params) when is_integer(Light), is_integer(Pname) ->
    erlang:error({abstract_method, glLightfv}).

glLineWidth(This, Width) when is_number(Width) ->
    erlang:error({abstract_method, glLineWidth}).

glLoadIdentity(This) ->
    erlang:error({abstract_method, glLoadIdentity}).

glLoadMatrixf(This, M, Offset) when (is_tuple(M) orelse M =:= undefined), is_integer(Offset) ->
    erlang:error({abstract_method, glLoadMatrixf}).

glLoadMatrixf(This, M) ->
    erlang:error({abstract_method, glLoadMatrixf}).

glLogicOp(This, Opcode) when is_integer(Opcode) ->
    erlang:error({abstract_method, glLogicOp}).

glMaterialf(This, Face, Pname, Param) when is_integer(Face), is_integer(Pname), is_number(Param) ->
    erlang:error({abstract_method, glMaterialf}).

glMaterialfv(This, Face, Pname, Params, Offset) when is_integer(Face), is_integer(Pname), (is_tuple(Params) orelse Params =:= undefined), is_integer(Offset) ->
    erlang:error({abstract_method, glMaterialfv}).

glMaterialfv(This, Face, Pname, Params) when is_integer(Face), is_integer(Pname) ->
    erlang:error({abstract_method, glMaterialfv}).

glMatrixMode(This, Mode) when is_integer(Mode) ->
    erlang:error({abstract_method, glMatrixMode}).

glMultMatrixf(This, M, Offset) when (is_tuple(M) orelse M =:= undefined), is_integer(Offset) ->
    erlang:error({abstract_method, glMultMatrixf}).

glMultMatrixf(This, M) ->
    erlang:error({abstract_method, glMultMatrixf}).

glMultiTexCoord4f(This, Target, S, T, R, Q) when is_integer(Target), is_number(S), is_number(T), is_number(R), is_number(Q) ->
    erlang:error({abstract_method, glMultiTexCoord4f}).

glNormal3f(This, Nx, Ny, Nz) when is_number(Nx), is_number(Ny), is_number(Nz) ->
    erlang:error({abstract_method, glNormal3f}).

glNormalPointer(This, Type, Stride, Pointer) when is_integer(Type), is_integer(Stride) ->
    erlang:error({abstract_method, glNormalPointer}).

glOrthof(This, Left, Right, Bottom, Top, ZNear, ZFar) when is_number(Left), is_number(Right), is_number(Bottom), is_number(Top), is_number(ZNear), is_number(ZFar) ->
    erlang:error({abstract_method, glOrthof}).

glPixelStorei(This, Pname, Param) when is_integer(Pname), is_integer(Param) ->
    erlang:error({abstract_method, glPixelStorei}).

glPointSize(This, Size) when is_number(Size) ->
    erlang:error({abstract_method, glPointSize}).

glPolygonOffset(This, Factor, Units) when is_number(Factor), is_number(Units) ->
    erlang:error({abstract_method, glPolygonOffset}).

glPopMatrix(This) ->
    erlang:error({abstract_method, glPopMatrix}).

glPushMatrix(This) ->
    erlang:error({abstract_method, glPushMatrix}).

glReadPixels(This, X, Y, Width, Height, Format, Type, Pixels) when is_integer(X), is_integer(Y), is_integer(Width), is_integer(Height), is_integer(Format), is_integer(Type) ->
    erlang:error({abstract_method, glReadPixels}).

glRotatef(This, Angle, X, Y, Z) when is_number(Angle), is_number(X), is_number(Y), is_number(Z) ->
    erlang:error({abstract_method, glRotatef}).

glRotatex(This, Angle, X, Y, Z) when is_integer(Angle), is_integer(X), is_integer(Y), is_integer(Z) ->
    erlang:error({abstract_method, glRotatex}).

glSampleCoverage(This, Value, Invert) when is_number(Value), is_boolean(Invert) ->
    erlang:error({abstract_method, glSampleCoverage}).

glScalef(This, X, Y, Z) when is_number(X), is_number(Y), is_number(Z) ->
    erlang:error({abstract_method, glScalef}).

glScalex(This, X, Y, Z) when is_integer(X), is_integer(Y), is_integer(Z) ->
    erlang:error({abstract_method, glScalex}).

glScissor(This, X, Y, Width, Height) when is_integer(X), is_integer(Y), is_integer(Width), is_integer(Height) ->
    erlang:error({abstract_method, glScissor}).

glShadeModel(This, Mode) when is_integer(Mode) ->
    erlang:error({abstract_method, glShadeModel}).

glStencilFunc(This, Func, Ref, Mask) when is_integer(Func), is_integer(Ref), is_integer(Mask) ->
    erlang:error({abstract_method, glStencilFunc}).

glStencilMask(This, Mask) when is_integer(Mask) ->
    erlang:error({abstract_method, glStencilMask}).

glStencilOp(This, Fail, Zfail, Zpass) when is_integer(Fail), is_integer(Zfail), is_integer(Zpass) ->
    erlang:error({abstract_method, glStencilOp}).

glTexCoordPointer(This, Size, Type, Stride, Pointer) when is_integer(Size), is_integer(Type), is_integer(Stride) ->
    erlang:error({abstract_method, glTexCoordPointer}).

glTexEnvf(This, Target, Pname, Param) when is_integer(Target), is_integer(Pname), is_number(Param) ->
    erlang:error({abstract_method, glTexEnvf}).

glTexEnvfv(This, Target, Pname, Params, Offset) when is_integer(Target), is_integer(Pname), (is_tuple(Params) orelse Params =:= undefined), is_integer(Offset) ->
    erlang:error({abstract_method, glTexEnvfv}).

glTexEnvfv(This, Target, Pname, Params) when is_integer(Target), is_integer(Pname) ->
    erlang:error({abstract_method, glTexEnvfv}).

glTexImage2D(This, Target, Level, Internalformat, Width, Height, Border, Format, Type, Pixels) when is_integer(Target), is_integer(Level), is_integer(Internalformat), is_integer(Width), is_integer(Height), is_integer(Border), is_integer(Format), is_integer(Type) ->
    erlang:error({abstract_method, glTexImage2D}).

glTexParameterf(This, Target, Pname, Param) when is_integer(Target), is_integer(Pname), is_number(Param) ->
    erlang:error({abstract_method, glTexParameterf}).

glTexParameteri(This, Target, Pname, Param) when is_integer(Target), is_integer(Pname), is_integer(Param) ->
    erlang:error({abstract_method, glTexParameteri}).

glTexSubImage2D(This, Target, Level, Xoffset, Yoffset, Width, Height, Format, Type, Pixels) when is_integer(Target), is_integer(Level), is_integer(Xoffset), is_integer(Yoffset), is_integer(Width), is_integer(Height), is_integer(Format), is_integer(Type) ->
    erlang:error({abstract_method, glTexSubImage2D}).

glTranslatef(This, X, Y, Z) when is_number(X), is_number(Y), is_number(Z) ->
    erlang:error({abstract_method, glTranslatef}).

glVertexPointer(This, Size, Type, Stride, Pointer) when is_integer(Size), is_integer(Type), is_integer(Stride) ->
    erlang:error({abstract_method, glVertexPointer}).

glViewport(This, X, Y, Width, Height) when is_integer(X), is_integer(Y), is_integer(Width), is_integer(Height) ->
    erlang:error({abstract_method, glViewport}).

glBegin(This, I) when is_integer(I) ->
    erlang:error({abstract_method, glBegin}).

glEnd(This) ->
    erlang:error({abstract_method, glEnd}).

glVertex3f(This, F, F2, F3) when is_number(F), is_number(F2), is_number(F3) ->
    erlang:error({abstract_method, glVertex3f}).

glPolygonMode(This, I, I1) when is_integer(I), is_integer(I1) ->
    erlang:error({abstract_method, glPolygonMode}).

