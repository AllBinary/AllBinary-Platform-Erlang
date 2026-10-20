% 
% AllBinary Open License Version 1 
% Copyright (c) 2025 AllBinary 
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
% package org.allbinary.device
% import javax.microedition.khronos.opengles.GL10
% import java.nio.Buffer
% import java.nio.FloatBuffer
% import java.nio.IntBuffer
% import org.allbinary.logic.string.StringUtil

-module('NullGL10').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).
% implements GL10

static_init() ->
    put({?MODULE, 'NULL_GL10'}, 'NullGL10':new()),
    ok.

init_fields(This) ->
    ok.

new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    init_fields(This).


glActiveTexture(This, Texture) when is_integer(Texture) ->
        ok.

glAlphaFunc(This, Func, Ref) when is_integer(Func), is_number(Ref) ->
        ok.

glBindTexture(This, Target, Texture) when is_integer(Target), is_integer(Texture) ->
        ok.

glBlendFunc(This, Sfactor, Dfactor) when is_integer(Sfactor), is_integer(Dfactor) ->
        ok.

glClear(This, Mask) when is_integer(Mask) ->
        ok.

glClearColor(This, Red, Green, Blue, Alpha) when is_number(Red), is_number(Green), is_number(Blue), is_number(Alpha) ->
        ok.

glClearDepthf(This, Depth) when is_number(Depth) ->
        ok.

glClearStencil(This, S) when is_integer(S) ->
        ok.

glClientActiveTexture(This, Texture) when is_integer(Texture) ->
        ok.

glColor4f(This, Red, Green, Blue, Alpha) when is_number(Red), is_number(Green), is_number(Blue), is_number(Alpha) ->
        ok.

glColorMask(This, Red, Green, Blue, Alpha) when is_boolean(Red), is_boolean(Green), is_boolean(Blue), is_boolean(Alpha) ->
        ok.

glColorPointer(This, Size, Type, Stride, Pointer) when is_integer(Size), is_integer(Type), is_integer(Stride) ->
        ok.

glCompressedTexImage2D(This, Target, Level, Internalformat, Width, Height, Border, ImageSize, Data) when is_integer(Target), is_integer(Level), is_integer(Internalformat), is_integer(Width), is_integer(Height), is_integer(Border), is_integer(ImageSize) ->
        ok.

glCompressedTexSubImage2D(This, Target, Level, Xoffset, Yoffset, Width, Height, Format, ImageSize, Data) when is_integer(Target), is_integer(Level), is_integer(Xoffset), is_integer(Yoffset), is_integer(Width), is_integer(Height), is_integer(Format), is_integer(ImageSize) ->
        ok.

glCopyTexImage2D(This, Target, Level, Internalformat, X, Y, Width, Height, Border) when is_integer(Target), is_integer(Level), is_integer(Internalformat), is_integer(X), is_integer(Y), is_integer(Width), is_integer(Height), is_integer(Border) ->
        ok.

glCopyTexSubImage2D(This, Target, Level, Xoffset, Yoffset, X, Y, Width, Height) when is_integer(Target), is_integer(Level), is_integer(Xoffset), is_integer(Yoffset), is_integer(X), is_integer(Y), is_integer(Width), is_integer(Height) ->
        ok.

glCullFace(This, Mode) when is_integer(Mode) ->
        ok.

glDeleteTextures(This, N, Textures, Offset) when is_integer(N), (is_tuple(Textures) orelse Textures =:= undefined), is_integer(Offset) ->
        ok.

glDeleteTextures(This, N, Textures) when is_integer(N) ->
        ok.

glDepthFunc(This, Func) when is_integer(Func) ->
        ok.

glDepthMask(This, Flag) when is_boolean(Flag) ->
        ok.

glDepthRangef(This, ZNear, ZFar) when is_number(ZNear), is_number(ZFar) ->
        ok.

glDisable(This, Cap) when is_integer(Cap) ->
        ok.

glDisableClientState(This, Array) when is_integer(Array) ->
        ok.

glDrawArrays(This, Mode, First, Count) when is_integer(Mode), is_integer(First), is_integer(Count) ->
        ok.

glDrawElements(This, Mode, Count, Type, Indices) when is_integer(Mode), is_integer(Count), is_integer(Type) ->
        ok.

glEnable(This, Cap) when is_integer(Cap) ->
        ok.

glEnableClientState(This, Array) when is_integer(Array) ->
        ok.

glFinish(This) ->
        ok.

glFlush(This) ->
        ok.

glFogf(This, Pname, Param) when is_integer(Pname), is_number(Param) ->
        ok.

glFogfv(This, Pname, Params, Offset) when is_integer(Pname), (is_tuple(Params) orelse Params =:= undefined), is_integer(Offset) ->
        ok.

glFogfv(This, Pname, Params) when is_integer(Pname) ->
        ok.

glFrontFace(This, Mode) when is_integer(Mode) ->
        ok.

glFrustumf(This, Left, Right, Bottom, Top, ZNear, ZFar) when is_number(Left), is_number(Right), is_number(Bottom), is_number(Top), is_number(ZNear), is_number(ZFar) ->
        ok.

glGenTextures(This, N, Textures, Offset) when is_integer(N), (is_tuple(Textures) orelse Textures =:= undefined), is_integer(Offset) ->
        ok.

glGenTextures(This, N, Textures) when is_integer(N) ->
        ok.

glGetError(This) ->
        0.

glGetIntegerv(This, Pname, Params, Offset) when is_integer(Pname), (is_tuple(Params) orelse Params =:= undefined), is_integer(Offset) ->
        ok.

glGetIntegerv(This, Pname, Params) when is_integer(Pname) ->
        ok.

glGetString(This, Name) when is_integer(Name) ->
        get({'StringUtil':getInstance(), 'EMPTY_STRING'}).

glHint(This, Target, Mode) when is_integer(Target), is_integer(Mode) ->
        ok.

glLightModelf(This, Pname, Param) when is_integer(Pname), is_number(Param) ->
        ok.

glLightModelfv(This, Pname, Params, Offset) when is_integer(Pname), (is_tuple(Params) orelse Params =:= undefined), is_integer(Offset) ->
        ok.

glLightModelfv(This, Pname, Params) when is_integer(Pname) ->
        ok.

glLightf(This, Light, Pname, Param) when is_integer(Light), is_integer(Pname), is_number(Param) ->
        ok.

glLightfv(This, Light, Pname, Params, Offset) when is_integer(Light), is_integer(Pname), (is_tuple(Params) orelse Params =:= undefined), is_integer(Offset) ->
        ok.

glLightfv(This, Light, Pname, Params) when is_integer(Light), is_integer(Pname) ->
        ok.

glLineWidth(This, Width) when is_number(Width) ->
        ok.

glLoadIdentity(This) ->
        ok.

glLoadMatrixf(This, M, Offset) when (is_tuple(M) orelse M =:= undefined), is_integer(Offset) ->
        ok.

glLoadMatrixf(This, M) ->
        ok.

glLogicOp(This, Opcode) when is_integer(Opcode) ->
        ok.

glMaterialf(This, Face, Pname, Param) when is_integer(Face), is_integer(Pname), is_number(Param) ->
        ok.

glMaterialfv(This, Face, Pname, Params, Offset) when is_integer(Face), is_integer(Pname), (is_tuple(Params) orelse Params =:= undefined), is_integer(Offset) ->
        ok.

glMaterialfv(This, Face, Pname, Params) when is_integer(Face), is_integer(Pname) ->
        ok.

glMatrixMode(This, Mode) when is_integer(Mode) ->
        ok.

glMultMatrixf(This, M, Offset) when (is_tuple(M) orelse M =:= undefined), is_integer(Offset) ->
        ok.

glMultMatrixf(This, M) ->
        ok.

glMultiTexCoord4f(This, Target, S, T, R, Q) when is_integer(Target), is_number(S), is_number(T), is_number(R), is_number(Q) ->
        ok.

glNormal3f(This, Nx, Ny, Nz) when is_number(Nx), is_number(Ny), is_number(Nz) ->
        ok.

glNormalPointer(This, Type, Stride, Pointer) when is_integer(Type), is_integer(Stride) ->
        ok.

glOrthof(This, Left, Right, Bottom, Top, ZNear, ZFar) when is_number(Left), is_number(Right), is_number(Bottom), is_number(Top), is_number(ZNear), is_number(ZFar) ->
        ok.

glPixelStorei(This, Pname, Param) when is_integer(Pname), is_integer(Param) ->
        ok.

glPointSize(This, Size) when is_number(Size) ->
        ok.

glPolygonOffset(This, Factor, Units) when is_number(Factor), is_number(Units) ->
        ok.

glPopMatrix(This) ->
        ok.

glPushMatrix(This) ->
        ok.

glReadPixels(This, X, Y, Width, Height, Format, Type, Pixels) when is_integer(X), is_integer(Y), is_integer(Width), is_integer(Height), is_integer(Format), is_integer(Type) ->
        ok.

glRotatef(This, Angle, X, Y, Z) when is_number(Angle), is_number(X), is_number(Y), is_number(Z) ->
        ok.

glRotatex(This, Angle, X, Y, Z) when is_integer(Angle), is_integer(X), is_integer(Y), is_integer(Z) ->
        ok.

glSampleCoverage(This, Value, Invert) when is_number(Value), is_boolean(Invert) ->
        ok.

glScalef(This, X, Y, Z) when is_number(X), is_number(Y), is_number(Z) ->
        ok.

glScalex(This, X, Y, Z) when is_integer(X), is_integer(Y), is_integer(Z) ->
        ok.

glScissor(This, X, Y, Width, Height) when is_integer(X), is_integer(Y), is_integer(Width), is_integer(Height) ->
        ok.

glShadeModel(This, Mode) when is_integer(Mode) ->
        ok.

glStencilFunc(This, Func, Ref, Mask) when is_integer(Func), is_integer(Ref), is_integer(Mask) ->
        ok.

glStencilMask(This, Mask) when is_integer(Mask) ->
        ok.

glStencilOp(This, Fail, Zfail, Zpass) when is_integer(Fail), is_integer(Zfail), is_integer(Zpass) ->
        ok.

glTexCoordPointer(This, Size, Type, Stride, Pointer) when is_integer(Size), is_integer(Type), is_integer(Stride) ->
        ok.

glTexEnvf(This, Target, Pname, Param) when is_integer(Target), is_integer(Pname), is_number(Param) ->
        ok.

glTexEnvfv(This, Target, Pname, Params, Offset) when is_integer(Target), is_integer(Pname), (is_tuple(Params) orelse Params =:= undefined), is_integer(Offset) ->
        ok.

glTexEnvfv(This, Target, Pname, Params) when is_integer(Target), is_integer(Pname) ->
        ok.

glTexImage2D(This, Target, Level, Internalformat, Width, Height, Border, Format, Type, Pixels) when is_integer(Target), is_integer(Level), is_integer(Internalformat), is_integer(Width), is_integer(Height), is_integer(Border), is_integer(Format), is_integer(Type) ->
        ok.

glTexParameterf(This, Target, Pname, Param) when is_integer(Target), is_integer(Pname), is_number(Param) ->
        ok.

glTexParameteri(This, Target, Pname, Param) when is_integer(Target), is_integer(Pname), is_integer(Param) ->
        ok.

glTexSubImage2D(This, Target, Level, Xoffset, Yoffset, Width, Height, Format, Type, Pixels) when is_integer(Target), is_integer(Level), is_integer(Xoffset), is_integer(Yoffset), is_integer(Width), is_integer(Height), is_integer(Format), is_integer(Type) ->
        ok.

glTranslatef(This, X, Y, Z) when is_number(X), is_number(Y), is_number(Z) ->
        ok.

glVertexPointer(This, Size, Type, Stride, Pointer) when is_integer(Size), is_integer(Type), is_integer(Stride) ->
        ok.

glViewport(This, X, Y, Width, Height) when is_integer(X), is_integer(Y), is_integer(Width), is_integer(Height) ->
        ok.

glBegin(This, I) when is_integer(I) ->
        ok.

glEnd(This) ->
        ok.

glVertex3f(This, F, F2, F3) when is_number(F), is_number(F2), is_number(F3) ->
        ok.

glPolygonMode(This, I, I1) when is_integer(I), is_integer(I1) ->
        ok.

