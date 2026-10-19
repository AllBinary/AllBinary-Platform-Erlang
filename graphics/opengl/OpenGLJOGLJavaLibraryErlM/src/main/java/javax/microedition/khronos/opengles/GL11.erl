% Generated Code Do Not Modify
% package javax.microedition.khronos.opengles

-module('GL11').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% Java interface

'$handle_undefined_function'(Function, Arguments) ->
    apply('GL10', Function, Arguments).

static_init() ->
    put({?MODULE, 'GL_ACTIVE_TEXTURE'}, 34016),
    put({?MODULE, 'GL_ADD_SIGNED'}, 34164),
    put({?MODULE, 'GL_ALPHA_SCALE'}, 3356),
    put({?MODULE, 'GL_ALPHA_TEST_FUNC'}, 3009),
    put({?MODULE, 'GL_ALPHA_TEST_REF'}, 3010),
    put({?MODULE, 'GL_ARRAY_BUFFER'}, 34962),
    put({?MODULE, 'GL_ARRAY_BUFFER_BINDING'}, 34964),
    put({?MODULE, 'GL_BLEND_DST'}, 3040),
    put({?MODULE, 'GL_BLEND_SRC'}, 3041),
    put({?MODULE, 'GL_BUFFER_ACCESS'}, 35003),
    put({?MODULE, 'GL_BUFFER_SIZE'}, 34660),
    put({?MODULE, 'GL_BUFFER_USAGE'}, 34661),
    put({?MODULE, 'GL_CLIENT_ACTIVE_TEXTURE'}, 34017),
    put({?MODULE, 'GL_CLIP_PLANE0'}, 12288),
    put({?MODULE, 'GL_CLIP_PLANE1'}, 12289),
    put({?MODULE, 'GL_CLIP_PLANE2'}, 12290),
    put({?MODULE, 'GL_CLIP_PLANE3'}, 12291),
    put({?MODULE, 'GL_CLIP_PLANE4'}, 12292),
    put({?MODULE, 'GL_CLIP_PLANE5'}, 12293),
    put({?MODULE, 'GL_COLOR_ARRAY_BUFFER_BINDING'}, 34968),
    put({?MODULE, 'GL_COLOR_ARRAY_POINTER'}, 32912),
    put({?MODULE, 'GL_COLOR_ARRAY_SIZE'}, 32897),
    put({?MODULE, 'GL_COLOR_ARRAY_STRIDE'}, 32899),
    put({?MODULE, 'GL_COLOR_ARRAY_TYPE'}, 32898),
    put({?MODULE, 'GL_COLOR_CLEAR_VALUE'}, 3106),
    put({?MODULE, 'GL_COLOR_WRITEMASK'}, 3107),
    put({?MODULE, 'GL_COMBINE'}, 34160),
    put({?MODULE, 'GL_COMBINE_ALPHA'}, 34162),
    put({?MODULE, 'GL_COMBINE_RGB'}, 34161),
    put({?MODULE, 'GL_CONSTANT'}, 34166),
    put({?MODULE, 'GL_COORD_REPLACE_OES'}, 34914),
    put({?MODULE, 'GL_CULL_FACE_MODE'}, 2885),
    put({?MODULE, 'GL_CURRENT_COLOR'}, 2816),
    put({?MODULE, 'GL_CURRENT_NORMAL'}, 2818),
    put({?MODULE, 'GL_CURRENT_TEXTURE_COORDS'}, 2819),
    put({?MODULE, 'GL_DEPTH_CLEAR_VALUE'}, 2931),
    put({?MODULE, 'GL_DEPTH_FUNC'}, 2932),
    put({?MODULE, 'GL_DEPTH_RANGE'}, 2928),
    put({?MODULE, 'GL_DEPTH_WRITEMASK'}, 2930),
    put({?MODULE, 'GL_DOT3_RGB'}, 34478),
    put({?MODULE, 'GL_DOT3_RGBA'}, 34479),
    put({?MODULE, 'GL_DYNAMIC_DRAW'}, 35048),
    put({?MODULE, 'GL_ELEMENT_ARRAY_BUFFER'}, 34963),
    put({?MODULE, 'GL_ELEMENT_ARRAY_BUFFER_BINDING'}, 34965),
    put({?MODULE, 'GL_FRONT_FACE'}, 2886),
    put({?MODULE, 'GL_GENERATE_MIPMAP'}, 33169),
    put({?MODULE, 'GL_GENERATE_MIPMAP_HINT'}, 33170),
    put({?MODULE, 'GL_INTERPOLATE'}, 34165),
    put({?MODULE, 'GL_LINE_WIDTH'}, 2849),
    put({?MODULE, 'GL_LOGIC_OP_MODE'}, 3056),
    put({?MODULE, 'GL_MATRIX_MODE'}, 2976),
    put({?MODULE, 'GL_MAX_CLIP_PLANES'}, 3378),
    put({?MODULE, 'GL_MODELVIEW_MATRIX'}, 2982),
    put({?MODULE, 'GL_MODELVIEW_MATRIX_FLOAT_AS_INT_BITS_OES'}, 35213),
    put({?MODULE, 'GL_MODELVIEW_STACK_DEPTH'}, 2979),
    put({?MODULE, 'GL_NORMAL_ARRAY_BUFFER_BINDING'}, 34967),
    put({?MODULE, 'GL_NORMAL_ARRAY_POINTER'}, 32911),
    put({?MODULE, 'GL_NORMAL_ARRAY_STRIDE'}, 32895),
    put({?MODULE, 'GL_NORMAL_ARRAY_TYPE'}, 32894),
    put({?MODULE, 'GL_OPERAND0_ALPHA'}, 34200),
    put({?MODULE, 'GL_OPERAND0_RGB'}, 34192),
    put({?MODULE, 'GL_OPERAND1_ALPHA'}, 34201),
    put({?MODULE, 'GL_OPERAND1_RGB'}, 34193),
    put({?MODULE, 'GL_OPERAND2_ALPHA'}, 34202),
    put({?MODULE, 'GL_OPERAND2_RGB'}, 34194),
    put({?MODULE, 'GL_POINT_DISTANCE_ATTENUATION'}, 33065),
    put({?MODULE, 'GL_POINT_FADE_THRESHOLD_SIZE'}, 33064),
    put({?MODULE, 'GL_POINT_SIZE'}, 2833),
    put({?MODULE, 'GL_POINT_SIZE_ARRAY_BUFFER_BINDING_OES'}, 35743),
    put({?MODULE, 'GL_POINT_SIZE_ARRAY_OES'}, 35740),
    put({?MODULE, 'GL_POINT_SIZE_ARRAY_POINTER_OES'}, 35212),
    put({?MODULE, 'GL_POINT_SIZE_ARRAY_STRIDE_OES'}, 35211),
    put({?MODULE, 'GL_POINT_SIZE_ARRAY_TYPE_OES'}, 35210),
    put({?MODULE, 'GL_POINT_SIZE_MAX'}, 33063),
    put({?MODULE, 'GL_POINT_SIZE_MIN'}, 33062),
    put({?MODULE, 'GL_POINT_SPRITE_OES'}, 34913),
    put({?MODULE, 'GL_POLYGON_OFFSET_FACTOR'}, 32824),
    put({?MODULE, 'GL_POLYGON_OFFSET_UNITS'}, 10752),
    put({?MODULE, 'GL_PREVIOUS'}, 34168),
    put({?MODULE, 'GL_PRIMARY_COLOR'}, 34167),
    put({?MODULE, 'GL_PROJECTION_MATRIX'}, 2983),
    put({?MODULE, 'GL_PROJECTION_MATRIX_FLOAT_AS_INT_BITS_OES'}, 35214),
    put({?MODULE, 'GL_PROJECTION_STACK_DEPTH'}, 2980),
    put({?MODULE, 'GL_RGB_SCALE'}, 34163),
    put({?MODULE, 'GL_SAMPLE_BUFFERS'}, 32936),
    put({?MODULE, 'GL_SAMPLE_COVERAGE_INVERT'}, 32939),
    put({?MODULE, 'GL_SAMPLE_COVERAGE_VALUE'}, 32938),
    put({?MODULE, 'GL_SAMPLES'}, 32937),
    put({?MODULE, 'GL_SCISSOR_BOX'}, 3088),
    put({?MODULE, 'GL_SHADE_MODEL'}, 2900),
    put({?MODULE, 'GL_SRC0_ALPHA'}, 34184),
    put({?MODULE, 'GL_SRC0_RGB'}, 34176),
    put({?MODULE, 'GL_SRC1_ALPHA'}, 34185),
    put({?MODULE, 'GL_SRC1_RGB'}, 34177),
    put({?MODULE, 'GL_SRC2_ALPHA'}, 34186),
    put({?MODULE, 'GL_SRC2_RGB'}, 34178),
    put({?MODULE, 'GL_STATIC_DRAW'}, 35044),
    put({?MODULE, 'GL_STENCIL_CLEAR_VALUE'}, 2961),
    put({?MODULE, 'GL_STENCIL_FAIL'}, 2964),
    put({?MODULE, 'GL_STENCIL_FUNC'}, 2962),
    put({?MODULE, 'GL_STENCIL_PASS_DEPTH_FAIL'}, 2965),
    put({?MODULE, 'GL_STENCIL_PASS_DEPTH_PASS'}, 2966),
    put({?MODULE, 'GL_STENCIL_REF'}, 2967),
    put({?MODULE, 'GL_STENCIL_VALUE_MASK'}, 2963),
    put({?MODULE, 'GL_STENCIL_WRITEMASK'}, 2968),
    put({?MODULE, 'GL_SUBTRACT'}, 34023),
    put({?MODULE, 'GL_TEXTURE_BINDING_2D'}, 32873),
    put({?MODULE, 'GL_TEXTURE_COORD_ARRAY_BUFFER_BINDING'}, 34970),
    put({?MODULE, 'GL_TEXTURE_COORD_ARRAY_POINTER'}, 32914),
    put({?MODULE, 'GL_TEXTURE_COORD_ARRAY_SIZE'}, 32904),
    put({?MODULE, 'GL_TEXTURE_COORD_ARRAY_STRIDE'}, 32906),
    put({?MODULE, 'GL_TEXTURE_COORD_ARRAY_TYPE'}, 32905),
    put({?MODULE, 'GL_TEXTURE_MATRIX'}, 2984),
    put({?MODULE, 'GL_TEXTURE_MATRIX_FLOAT_AS_INT_BITS_OES'}, 35215),
    put({?MODULE, 'GL_TEXTURE_STACK_DEPTH'}, 2981),
    put({?MODULE, 'GL_VERTEX_ARRAY_BUFFER_BINDING'}, 34966),
    put({?MODULE, 'GL_VERTEX_ARRAY_POINTER'}, 32910),
    put({?MODULE, 'GL_VERTEX_ARRAY_SIZE'}, 32890),
    put({?MODULE, 'GL_VERTEX_ARRAY_STRIDE'}, 32892),
    put({?MODULE, 'GL_VERTEX_ARRAY_TYPE'}, 32891),
    put({?MODULE, 'GL_VIEWPORT'}, 2978),
    put({?MODULE, 'GL_WRITE_ONLY'}, 35001),
    ok.


glBindBuffer(This, Target, Buffer) when is_integer(Target), is_integer(Buffer) ->
    erlang:error({abstract_method, glBindBuffer}).

glBufferData(This, Target, Size, Data, Usage) when is_integer(Target), is_integer(Size), is_integer(Usage) ->
    erlang:error({abstract_method, glBufferData}).

glBufferSubData(This, Target, Offset, Size, Data) when is_integer(Target), is_integer(Offset), is_integer(Size) ->
    erlang:error({abstract_method, glBufferSubData}).

glClipPlanef(This, Plane, Equation, Offset) when is_integer(Plane), (is_tuple(Equation) orelse Equation =:= undefined), is_integer(Offset) ->
    erlang:error({abstract_method, glClipPlanef}).

glClipPlanef(This, Plane, Equation) when is_integer(Plane) ->
    erlang:error({abstract_method, glClipPlanef}).

glColor4ub(This, Red, Green, Blue, Alpha) when is_integer(Red), is_integer(Green), is_integer(Blue), is_integer(Alpha) ->
    erlang:error({abstract_method, glColor4ub}).

glColorPointer(This, Size, Type, Stride, Offset) when is_integer(Size), is_integer(Type), is_integer(Stride), is_integer(Offset) ->
    erlang:error({abstract_method, glColorPointer}).

glDeleteBuffers(This, N, Buffers, Offset) when is_integer(N), (is_tuple(Buffers) orelse Buffers =:= undefined), is_integer(Offset) ->
    erlang:error({abstract_method, glDeleteBuffers}).

glDeleteBuffers(This, N, Buffers) when is_integer(N) ->
    erlang:error({abstract_method, glDeleteBuffers}).

glDrawElements(This, Mode, Count, Type, Offset) when is_integer(Mode), is_integer(Count), is_integer(Type), is_integer(Offset) ->
    erlang:error({abstract_method, glDrawElements}).

glGenBuffers(This, N, Buffers, Offset) when is_integer(N), (is_tuple(Buffers) orelse Buffers =:= undefined), is_integer(Offset) ->
    erlang:error({abstract_method, glGenBuffers}).

glGenBuffers(This, N, Buffers) when is_integer(N) ->
    erlang:error({abstract_method, glGenBuffers}).

glGetBufferParameteriv(This, Target, Pname, Params, Offset) when is_integer(Target), is_integer(Pname), (is_tuple(Params) orelse Params =:= undefined), is_integer(Offset) ->
    erlang:error({abstract_method, glGetBufferParameteriv}).

glGetBufferParameteriv(This, Target, Pname, Params) when is_integer(Target), is_integer(Pname) ->
    erlang:error({abstract_method, glGetBufferParameteriv}).

glGetClipPlanef(This, Pname, Eqn, Offset) when is_integer(Pname), (is_tuple(Eqn) orelse Eqn =:= undefined), is_integer(Offset) ->
    erlang:error({abstract_method, glGetClipPlanef}).

glGetClipPlanef(This, Pname, Eqn) when is_integer(Pname) ->
    erlang:error({abstract_method, glGetClipPlanef}).

glGetFloatv(This, Pname, Params, Offset) when is_integer(Pname), (is_tuple(Params) orelse Params =:= undefined), is_integer(Offset) ->
    erlang:error({abstract_method, glGetFloatv}).

glGetFloatv(This, Pname, Params) when is_integer(Pname) ->
    erlang:error({abstract_method, glGetFloatv}).

glGetLightfv(This, Light, Pname, Params, Offset) when is_integer(Light), is_integer(Pname), (is_tuple(Params) orelse Params =:= undefined), is_integer(Offset) ->
    erlang:error({abstract_method, glGetLightfv}).

glGetLightfv(This, Light, Pname, Params) when is_integer(Light), is_integer(Pname) ->
    erlang:error({abstract_method, glGetLightfv}).

glGetMaterialfv(This, Face, Pname, Params, Offset) when is_integer(Face), is_integer(Pname), (is_tuple(Params) orelse Params =:= undefined), is_integer(Offset) ->
    erlang:error({abstract_method, glGetMaterialfv}).

glGetMaterialfv(This, Face, Pname, Params) when is_integer(Face), is_integer(Pname) ->
    erlang:error({abstract_method, glGetMaterialfv}).

glGetTexEnviv(This, Env, Pname, Params, Offset) when is_integer(Env), is_integer(Pname), (is_tuple(Params) orelse Params =:= undefined), is_integer(Offset) ->
    erlang:error({abstract_method, glGetTexEnviv}).

glGetTexEnviv(This, Env, Pname, Params) when is_integer(Env), is_integer(Pname) ->
    erlang:error({abstract_method, glGetTexEnviv}).

glGetTexParameterfv(This, Target, Pname, Params, Offset) when is_integer(Target), is_integer(Pname), (is_tuple(Params) orelse Params =:= undefined), is_integer(Offset) ->
    erlang:error({abstract_method, glGetTexParameterfv}).

glGetTexParameterfv(This, Target, Pname, Params) when is_integer(Target), is_integer(Pname) ->
    erlang:error({abstract_method, glGetTexParameterfv}).

glGetTexParameteriv(This, Target, Pname, Params, Offset) when is_integer(Target), is_integer(Pname), (is_tuple(Params) orelse Params =:= undefined), is_integer(Offset) ->
    erlang:error({abstract_method, glGetTexParameteriv}).

glGetTexParameteriv(This, Target, Pname, Params) when is_integer(Target), is_integer(Pname) ->
    erlang:error({abstract_method, glGetTexParameteriv}).

glIsBuffer(This, Buffer) when is_integer(Buffer) ->
    erlang:error({abstract_method, glIsBuffer}).

glIsEnabled(This, Cap) when is_integer(Cap) ->
    erlang:error({abstract_method, glIsEnabled}).

glIsTexture(This, Texture) when is_integer(Texture) ->
    erlang:error({abstract_method, glIsTexture}).

glNormalPointer(This, Type, Stride, Offset) when is_integer(Type), is_integer(Stride), is_integer(Offset) ->
    erlang:error({abstract_method, glNormalPointer}).

glPointParameterf(This, Pname, Param) when is_integer(Pname), is_number(Param) ->
    erlang:error({abstract_method, glPointParameterf}).

glPointParameterfv(This, Pname, Params, Offset) when is_integer(Pname), (is_tuple(Params) orelse Params =:= undefined), is_integer(Offset) ->
    erlang:error({abstract_method, glPointParameterfv}).

glPointParameterfv(This, Pname, Params) when is_integer(Pname) ->
    erlang:error({abstract_method, glPointParameterfv}).

glTexCoordPointer(This, Size, Type, Stride, Offset) when is_integer(Size), is_integer(Type), is_integer(Stride), is_integer(Offset) ->
    erlang:error({abstract_method, glTexCoordPointer}).

glTexEnvi(This, Target, Pname, Param) when is_integer(Target), is_integer(Pname), is_integer(Param) ->
    erlang:error({abstract_method, glTexEnvi}).

glTexEnviv(This, Target, Pname, Params, Offset) when is_integer(Target), is_integer(Pname), (is_tuple(Params) orelse Params =:= undefined), is_integer(Offset) ->
    erlang:error({abstract_method, glTexEnviv}).

glTexEnviv(This, Target, Pname, Params) when is_integer(Target), is_integer(Pname) ->
    erlang:error({abstract_method, glTexEnviv}).

glTexParameterfv(This, Target, Pname, Params, Offset) when is_integer(Target), is_integer(Pname), (is_tuple(Params) orelse Params =:= undefined), is_integer(Offset) ->
    erlang:error({abstract_method, glTexParameterfv}).

glTexParameterfv(This, Target, Pname, Params) when is_integer(Target), is_integer(Pname) ->
    erlang:error({abstract_method, glTexParameterfv}).

glTexParameteri(This, Target, Pname, Param) when is_integer(Target), is_integer(Pname), is_integer(Param) ->
    erlang:error({abstract_method, glTexParameteri}).

glTexParameteriv(This, Target, Pname, Params, Offset) when is_integer(Target), is_integer(Pname), (is_tuple(Params) orelse Params =:= undefined), is_integer(Offset) ->
    erlang:error({abstract_method, glTexParameteriv}).

glTexParameteriv(This, Target, Pname, Params) when is_integer(Target), is_integer(Pname) ->
    erlang:error({abstract_method, glTexParameteriv}).

glVertexPointer(This, Size, Type, Stride, Offset) when is_integer(Size), is_integer(Type), is_integer(Stride), is_integer(Offset) ->
    erlang:error({abstract_method, glVertexPointer}).

