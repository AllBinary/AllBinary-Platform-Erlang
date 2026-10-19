% Generated Code Do Not Modify
% package javax.microedition.khronos.opengles

-module('GL11Ext').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% Java interface

'$handle_undefined_function'(Function, Arguments) ->
    apply('GL', Function, Arguments).

static_init() ->
    put({?MODULE, 'GL_MATRIX_INDEX_ARRAY_BUFFER_BINDING_OES'}, 35742),
    put({?MODULE, 'GL_MATRIX_INDEX_ARRAY_OES'}, 34884),
    put({?MODULE, 'GL_MATRIX_INDEX_ARRAY_POINTER_OES'}, 34889),
    put({?MODULE, 'GL_MATRIX_INDEX_ARRAY_SIZE_OES'}, 34886),
    put({?MODULE, 'GL_MATRIX_INDEX_ARRAY_STRIDE_OES'}, 34888),
    put({?MODULE, 'GL_MATRIX_INDEX_ARRAY_TYPE_OES'}, 34887),
    put({?MODULE, 'GL_MATRIX_PALETTE_OES'}, 34880),
    put({?MODULE, 'GL_MAX_PALETTE_MATRICES_OES'}, 34882),
    put({?MODULE, 'GL_MAX_VERTEX_UNITS_OES'}, 34468),
    put({?MODULE, 'GL_TEXTURE_CROP_RECT_OES'}, 35741),
    put({?MODULE, 'GL_WEIGHT_ARRAY_BUFFER_BINDING_OES'}, 34974),
    put({?MODULE, 'GL_WEIGHT_ARRAY_OES'}, 34477),
    put({?MODULE, 'GL_WEIGHT_ARRAY_POINTER_OES'}, 34476),
    put({?MODULE, 'GL_WEIGHT_ARRAY_SIZE_OES'}, 34475),
    put({?MODULE, 'GL_WEIGHT_ARRAY_STRIDE_OES'}, 34474),
    put({?MODULE, 'GL_WEIGHT_ARRAY_TYPE_OES'}, 34473),
    ok.


glTexParameterfv(This, Target, Pname, Param, Offset) when is_integer(Target), is_integer(Pname), (is_tuple(Param) orelse Param =:= undefined), is_integer(Offset) ->
    erlang:error({abstract_method, glTexParameterfv}).

glCurrentPaletteMatrixOES(This, Matrixpaletteindex) when is_integer(Matrixpaletteindex) ->
    erlang:error({abstract_method, glCurrentPaletteMatrixOES}).

glDrawTexfOES(This, X, Y, Z, Width, Height) when is_number(X), is_number(Y), is_number(Z), is_number(Width), is_number(Height) ->
    erlang:error({abstract_method, glDrawTexfOES}).

glDrawTexfvOES(This, Coords, Offset) when (is_tuple(Coords) orelse Coords =:= undefined), is_integer(Offset) ->
    erlang:error({abstract_method, glDrawTexfvOES}).

glDrawTexfvOES(This, Coords) ->
    erlang:error({abstract_method, glDrawTexfvOES}).

glDrawTexiOES(This, X, Y, Z, Width, Height) when is_integer(X), is_integer(Y), is_integer(Z), is_integer(Width), is_integer(Height) ->
    erlang:error({abstract_method, glDrawTexiOES}).

glDrawTexivOES(This, Coords, Offset) when (is_tuple(Coords) orelse Coords =:= undefined), is_integer(Offset) ->
    erlang:error({abstract_method, glDrawTexivOES}).

glDrawTexivOES(This, Coords) ->
    erlang:error({abstract_method, glDrawTexivOES}).

glDrawTexsOES(This, X, Y, Z, Width, Height) when is_integer(X), is_integer(Y), is_integer(Z), is_integer(Width), is_integer(Height) ->
    erlang:error({abstract_method, glDrawTexsOES}).

glDrawTexsvOES(This, Coords, Offset) when (is_tuple(Coords) orelse Coords =:= undefined), is_integer(Offset) ->
    erlang:error({abstract_method, glDrawTexsvOES}).

glDrawTexsvOES(This, Coords) ->
    erlang:error({abstract_method, glDrawTexsvOES}).

glDrawTexxOES(This, X, Y, Z, Width, Height) when is_integer(X), is_integer(Y), is_integer(Z), is_integer(Width), is_integer(Height) ->
    erlang:error({abstract_method, glDrawTexxOES}).

glDrawTexxvOES(This, Coords, Offset) when (is_tuple(Coords) orelse Coords =:= undefined), is_integer(Offset) ->
    erlang:error({abstract_method, glDrawTexxvOES}).

glDrawTexxvOES(This, Coords) ->
    erlang:error({abstract_method, glDrawTexxvOES}).

glEnable(This, Cap) when is_integer(Cap) ->
    erlang:error({abstract_method, glEnable}).

glEnableClientState(This, Array) when is_integer(Array) ->
    erlang:error({abstract_method, glEnableClientState}).

glLoadPaletteFromModelViewMatrixOES(This) ->
    erlang:error({abstract_method, glLoadPaletteFromModelViewMatrixOES}).

glMatrixIndexPointerOES(This, Size, Type, Stride, Offset) when is_integer(Size), is_integer(Type), is_integer(Stride), is_integer(Offset) ->
    erlang:error({abstract_method, glMatrixIndexPointerOES});
glMatrixIndexPointerOES(This, Size, Type, Stride, Pointer) when is_integer(Size), is_integer(Type), is_integer(Stride) ->
    erlang:error({abstract_method, glMatrixIndexPointerOES}).


glWeightPointerOES(This, Size, Type, Stride, Offset) when is_integer(Size), is_integer(Type), is_integer(Stride), is_integer(Offset) ->
    erlang:error({abstract_method, glWeightPointerOES});
glWeightPointerOES(This, Size, Type, Stride, Pointer) when is_integer(Size), is_integer(Type), is_integer(Stride) ->
    erlang:error({abstract_method, glWeightPointerOES}).


