%
% AllBinary Open License Version 1
% Copyright (c) 2011 AllBinary
% 
% By agreeing to this license you and any business entity you represent are
% legally bound to the AllBinary Open License Version 1 legal agreement.
% 
% You may obtain the AllBinary Open License Version 1 legal agreement from
% AllBinary or the root directory of AllBinary's AllBinary Platform repository.
% 
% Created By: Travis Berthelot
%   
% Generated Code Do Not Modify
% package org.allbinary.opengles
% import com.jogamp.opengl.GL
% import com.jogamp.opengl.GL2

-module('JOGL11').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements GL11

'$handle_undefined_function'(Function, Arguments) ->
    apply('JOGL10', Function, Arguments).

init_fields(This) ->
    put({This, gl11}, undefined),
    ok.


new(Gl) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Gl),
    This.

init(This, Gl) ->
        init(This, Gl, Gl).

new(Gl, Gl2) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Gl, Gl2),
    This.

init(This, Gl, Gl2) ->
        'JOGL10':init(This, Gl, Gl2),
        init_fields(This),
        put({This, gl11}, (get({This, '$class'})):getJOGLGL(This)).

glBindBuffer(This, Target, Buffer) when is_integer(Target), is_integer(Buffer) ->
        (get({get({This, gl11}), '$class'})):glBindBuffer(get({This, gl11}), Target, Buffer).

glBufferData(This, Target, Size, Data, Usage) when is_integer(Target), is_integer(Size), is_integer(Usage) ->
        (get({get({This, gl11}), '$class'})):glBufferData(get({This, gl11}), Target, Size, Data, Usage).

glBufferSubData(This, Target, Offset, Size, Data) when is_integer(Target), is_integer(Offset), is_integer(Size) ->
        (get({get({This, gl11}), '$class'})):glBufferSubData(get({This, gl11}), Target, Offset, Size, Data).

glClipPlanef(This, Plane, Equation, Offset) when is_integer(Plane), (is_tuple(Equation) orelse Equation =:= undefined), is_integer(Offset) ->
        (get({get({This, gl11}), '$class'})):glClipPlanef(get({This, gl11}), Plane, Equation, Offset).

glClipPlanef(This, Plane, Equation) when is_integer(Plane) ->
        (get({get({This, gl11}), '$class'})):glClipPlanef(get({This, gl11}), Plane, Equation).

glColor4ub(This, Red, Green, Blue, Alpha) when is_integer(Red), is_integer(Green), is_integer(Blue), is_integer(Alpha) ->
        (get({get({This, gl11}), '$class'})):glColor4ub(get({This, gl11}), Red, Green, Blue, Alpha).

glColorPointer(This, Size, Type, Stride, Offset) when is_integer(Size), is_integer(Type), is_integer(Stride), is_integer(Offset) ->
        (get({get({This, gl11}), '$class'})):glColorPointer(get({This, gl11}), Size, Type, Stride, Offset).

glDeleteBuffers(This, N, Buffers, Offset) when is_integer(N), (is_tuple(Buffers) orelse Buffers =:= undefined), is_integer(Offset) ->
        (get({get({This, gl11}), '$class'})):glDeleteBuffers(get({This, gl11}), N, Buffers, Offset).

glDeleteBuffers(This, N, Buffers) when is_integer(N) ->
        (get({get({This, gl11}), '$class'})):glDeleteBuffers(get({This, gl11}), N, Buffers).

glDrawElements(This, Mode, Count, Type, Offset) when is_integer(Mode), is_integer(Count), is_integer(Type), is_integer(Offset) ->
        (get({get({This, gl11}), '$class'})):glDrawElements(get({This, gl11}), Mode, Count, Type, Offset).

glGenBuffers(This, N, Buffers, Offset) when is_integer(N), (is_tuple(Buffers) orelse Buffers =:= undefined), is_integer(Offset) ->
        (get({get({This, gl11}), '$class'})):glGenBuffers(get({This, gl11}), N, Buffers, Offset).

glGenBuffers(This, N, Buffers) when is_integer(N) ->
        (get({get({This, gl11}), '$class'})):glGenBuffers(get({This, gl11}), N, Buffers).

glGetBufferParameteriv(This, Target, Pname, Params, Offset) when is_integer(Target), is_integer(Pname), (is_tuple(Params) orelse Params =:= undefined), is_integer(Offset) ->
        (get({get({This, gl11}), '$class'})):glGetBufferParameteriv(get({This, gl11}), Target, Pname, Params, Offset).

glGetBufferParameteriv(This, Target, Pname, Params) when is_integer(Target), is_integer(Pname) ->
        (get({get({This, gl11}), '$class'})):glGetBufferParameteriv(get({This, gl11}), Target, Pname, Params).

glGetClipPlanef(This, Pname, Eqn, Offset) when is_integer(Pname), (is_tuple(Eqn) orelse Eqn =:= undefined), is_integer(Offset) ->
        (get({get({This, gl11}), '$class'})):glGetClipPlanef(get({This, gl11}), Pname, Eqn, Offset).

glGetClipPlanef(This, Pname, Eqn) when is_integer(Pname) ->
        (get({get({This, gl11}), '$class'})):glGetClipPlanef(get({This, gl11}), Pname, Eqn).

glGetFloatv(This, Pname, Params, Offset) when is_integer(Pname), (is_tuple(Params) orelse Params =:= undefined), is_integer(Offset) ->
        (get({get({This, gl11}), '$class'})):glGetFloatv(get({This, gl11}), Pname, Params, Offset).

glGetFloatv(This, Pname, Params) when is_integer(Pname) ->
        (get({get({This, gl11}), '$class'})):glGetFloatv(get({This, gl11}), Pname, Params).

glGetLightfv(This, Light, Pname, Params, Offset) when is_integer(Light), is_integer(Pname), (is_tuple(Params) orelse Params =:= undefined), is_integer(Offset) ->
        (get({get({This, gl11}), '$class'})):glGetLightfv(get({This, gl11}), Light, Pname, Params, Offset).

glGetLightfv(This, Light, Pname, Params) when is_integer(Light), is_integer(Pname) ->
        (get({get({This, gl11}), '$class'})):glGetLightfv(get({This, gl11}), Light, Pname, Params).

glGetMaterialfv(This, Face, Pname, Params, Offset) when is_integer(Face), is_integer(Pname), (is_tuple(Params) orelse Params =:= undefined), is_integer(Offset) ->
        (get({get({This, gl11}), '$class'})):glGetMaterialfv(get({This, gl11}), Face, Pname, Params, Offset).

glGetMaterialfv(This, Face, Pname, Params) when is_integer(Face), is_integer(Pname) ->
        (get({get({This, gl11}), '$class'})):glGetMaterialfv(get({This, gl11}), Face, Pname, Params).

glGetTexEnviv(This, Env, Pname, Params, Offset) when is_integer(Env), is_integer(Pname), (is_tuple(Params) orelse Params =:= undefined), is_integer(Offset) ->
        (get({get({This, gl11}), '$class'})):glGetTexEnviv(get({This, gl11}), Env, Pname, Params, Offset).

glGetTexEnviv(This, Env, Pname, Params) when is_integer(Env), is_integer(Pname) ->
        (get({get({This, gl11}), '$class'})):glGetTexEnviv(get({This, gl11}), Env, Pname, Params).

glGetTexParameterfv(This, Target, Pname, Params, Offset) when is_integer(Target), is_integer(Pname), (is_tuple(Params) orelse Params =:= undefined), is_integer(Offset) ->
        (get({get({This, gl11}), '$class'})):glGetTexParameterfv(get({This, gl11}), Target, Pname, Params, Offset).

glGetTexParameterfv(This, Target, Pname, Params) when is_integer(Target), is_integer(Pname) ->
        (get({get({This, gl11}), '$class'})):glGetTexParameterfv(get({This, gl11}), Target, Pname, Params).

glGetTexParameteriv(This, Target, Pname, Params, Offset) when is_integer(Target), is_integer(Pname), (is_tuple(Params) orelse Params =:= undefined), is_integer(Offset) ->
        (get({get({This, gl11}), '$class'})):glGetTexParameteriv(get({This, gl11}), Target, Pname, Params, Offset).

glGetTexParameteriv(This, Target, Pname, Params) when is_integer(Target), is_integer(Pname) ->
        (get({get({This, gl11}), '$class'})):glGetTexParameteriv(get({This, gl11}), Target, Pname, Params).

glIsBuffer(This, Buffer) when is_integer(Buffer) ->
        (get({get({This, gl11}), '$class'})):glIsBuffer(get({This, gl11}), Buffer).

glIsEnabled(This, Cap) when is_integer(Cap) ->
        (get({get({This, gl11}), '$class'})):glIsEnabled(get({This, gl11}), Cap).

glIsTexture(This, Texture) when is_integer(Texture) ->
        (get({get({This, gl11}), '$class'})):glIsTexture(get({This, gl11}), Texture).

glNormalPointer(This, Type, Stride, Offset) when is_integer(Type), is_integer(Stride), is_integer(Offset) ->
        (get({get({This, gl11}), '$class'})):glNormalPointer(get({This, gl11}), Type, Stride, Offset).

glPointParameterf(This, Pname, Param) when is_integer(Pname), is_number(Param) ->
        (get({get({This, gl11}), '$class'})):glPointParameterf(get({This, gl11}), Pname, Param).

glPointParameterfv(This, Pname, Params, Offset) when is_integer(Pname), (is_tuple(Params) orelse Params =:= undefined), is_integer(Offset) ->
        (get({get({This, gl11}), '$class'})):glPointParameterfv(get({This, gl11}), Pname, Params, Offset).

glPointParameterfv(This, Pname, Params) when is_integer(Pname) ->
        (get({get({This, gl11}), '$class'})):glPointParameterfv(get({This, gl11}), Pname, Params).

glTexCoordPointer(This, Size, Type, Stride, Offset) when is_integer(Size), is_integer(Type), is_integer(Stride), is_integer(Offset) ->
        (get({get({This, gl11}), '$class'})):glTexCoordPointer(get({This, gl11}), Size, Type, Stride, Offset).

glTexEnvi(This, Target, Pname, Param) when is_integer(Target), is_integer(Pname), is_integer(Param) ->
        (get({get({This, gl11}), '$class'})):glTexEnvi(get({This, gl11}), Target, Pname, Param).

glTexEnviv(This, Target, Pname, Params, Offset) when is_integer(Target), is_integer(Pname), (is_tuple(Params) orelse Params =:= undefined), is_integer(Offset) ->
        (get({get({This, gl11}), '$class'})):glTexEnviv(get({This, gl11}), Target, Pname, Params, Offset).

glTexEnviv(This, Target, Pname, Params) when is_integer(Target), is_integer(Pname) ->
        (get({get({This, gl11}), '$class'})):glTexEnviv(get({This, gl11}), Target, Pname, Params).

glTexParameterfv(This, Target, Pname, Params, Offset) when is_integer(Target), is_integer(Pname), (is_tuple(Params) orelse Params =:= undefined), is_integer(Offset) ->
        (get({get({This, gl11}), '$class'})):glTexParameterfv(get({This, gl11}), Target, Pname, Params, Offset).

glTexParameterfv(This, Target, Pname, Params) when is_integer(Target), is_integer(Pname) ->
        (get({get({This, gl11}), '$class'})):glTexParameterfv(get({This, gl11}), Target, Pname, Params).

glTexParameteri(This, Target, Pname, Param) when is_integer(Target), is_integer(Pname), is_integer(Param) ->
        (get({get({This, gl11}), '$class'})):glTexParameteri(get({This, gl11}), Target, Pname, Param).

glTexParameteriv(This, Target, Pname, Params, Offset) when is_integer(Target), is_integer(Pname), (is_tuple(Params) orelse Params =:= undefined), is_integer(Offset) ->
        (get({get({This, gl11}), '$class'})):glTexParameteriv(get({This, gl11}), Target, Pname, Params, Offset).

glTexParameteriv(This, Target, Pname, Params) when is_integer(Target), is_integer(Pname) ->
        (get({get({This, gl11}), '$class'})):glTexParameteriv(get({This, gl11}), Target, Pname, Params).

glTexParameterxv(This, Target, Pname, Params, Offset) when is_integer(Target), is_integer(Pname), (is_tuple(Params) orelse Params =:= undefined), is_integer(Offset) ->
        (get({get({This, gl11}), '$class'})):glTexParameteriv(get({This, gl11}), Target, Pname, Params, Offset).

glVertexPointer(This, Size, Type, Stride, Offset) when is_integer(Size), is_integer(Type), is_integer(Stride), is_integer(Offset) ->
        (get({get({This, gl11}), '$class'})):glVertexPointer(get({This, gl11}), Size, Type, Stride, Offset).

