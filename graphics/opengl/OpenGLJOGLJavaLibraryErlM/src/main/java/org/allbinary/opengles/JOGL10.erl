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
% import com.jogamp.opengl.glu.GLU

-module('JOGL10').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements GL10

init_fields(This) ->
    put({This, 'RED'}, "red: "),
    put({This, 'GREEN'}, " green: "),
    put({This, 'BLUE'}, " blue: "),
    put({This, 'ALPHA'}, " alpha: "),
    put({This, 'PNAME'}, "pname: "),
    put({This, '_PNAME'}, " pname: "),
    put({This, 'PARAM'}, " param: "),
    put({This, 'PARAMS'}, " params: "),
    put({This, 'LIGHT'}, "light: "),
    put({This, 'FACE'}, "face: "),
    put({This, 'TARGET'}, "target: "),
    put({This, gl10}, undefined),
    put({This, glu}, undefined),
    put({This, 'GL_LINE'}, 0),
    put({This, 'GL_QUAD_STRIP'}, 0),
    ok.


new(Gl, Gl2) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This, Gl, Gl2),
    This.

init(This, Gl, Gl2) ->
    init_fields(This),
        put({This, gl10}, Gl2),
        put({This, glu}, 'GLU':createGLU(get({This, gl10}))),
        put({This, 'GL_LINE'}, get({get({get({get({'com', jogamp}), opengl}), 'GL2'}), 'GL_LINE'})),
        put({This, 'GL_QUAD_STRIP'}, get({get({get({get({'com', jogamp}), opengl}), 'GL2'}), 'GL_QUAD_STRIP'})).

getJOGLGL(This) ->
        get({This, gl10}).

glActiveTexture(This, Texture) when is_integer(Texture) ->
        (get({get({This, gl10}), '$class'})):glActiveTexture(get({This, gl10}), Texture).

glAlphaFunc(This, Func, Ref) when is_integer(Func), is_number(Ref) ->
        (get({get({This, gl10}), '$class'})):glAlphaFunc(get({This, gl10}), Func, Ref).

glBindTexture(This, Target, Texture) when is_integer(Target), is_integer(Texture) ->
        (get({get({This, gl10}), '$class'})):glBindTexture(get({This, gl10}), Target, Texture).

glBlendFunc(This, Sfactor, Dfactor) when is_integer(Sfactor), is_integer(Dfactor) ->
        (get({get({This, gl10}), '$class'})):glBlendFunc(get({This, gl10}), Sfactor, Dfactor).

glClear(This, Mask) when is_integer(Mask) ->
        (get({get({This, gl10}), '$class'})):glClear(get({This, gl10}), Mask).

glClearColor(This, Red, Green, Blue, Alpha) when is_number(Red), is_number(Green), is_number(Blue), is_number(Alpha) ->
        (get({get({This, gl10}), '$class'})):glClearColor(get({This, gl10}), Red, Green, Blue, Alpha).

glClearDepthf(This, Depth) when is_number(Depth) ->
        (get({get({This, gl10}), '$class'})):glClearDepthf(get({This, gl10}), Depth).

glClearStencil(This, S) when is_integer(S) ->
        (get({get({This, gl10}), '$class'})):glClearStencil(get({This, gl10}), S).

glClientActiveTexture(This, Texture) when is_integer(Texture) ->
        (get({get({This, gl10}), '$class'})):glClientActiveTexture(get({This, gl10}), Texture).

glColor4f(This, Red, Green, Blue, Alpha) when is_number(Red), is_number(Green), is_number(Blue), is_number(Alpha) ->
        (get({get({This, gl10}), '$class'})):glColor4f(get({This, gl10}), Red, Green, Blue, Alpha).

glColorMask(This, Red, Green, Blue, Alpha) when is_boolean(Red), is_boolean(Green), is_boolean(Blue), is_boolean(Alpha) ->
        (get({get({This, gl10}), '$class'})):glColorMask(get({This, gl10}), Red, Green, Blue, Alpha).

glColorPointer(This, Size, Type, Stride, Pointer) when is_integer(Size), is_integer(Type), is_integer(Stride) ->
        (get({get({This, gl10}), '$class'})):glColorPointer(get({This, gl10}), Size, Type, Stride, Pointer).

glCompressedTexImage2D(This, Target, Level, Internalformat, Width, Height, Border, ImageSize, Data) when is_integer(Target), is_integer(Level), is_integer(Internalformat), is_integer(Width), is_integer(Height), is_integer(Border), is_integer(ImageSize) ->
        (get({get({This, gl10}), '$class'})):glCompressedTexImage2D(get({This, gl10}), Target, Level, Internalformat, Width, Height, Border, ImageSize, Data).

glCompressedTexSubImage2D(This, Target, Level, Xoffset, Yoffset, Width, Height, Format, ImageSize, Data) when is_integer(Target), is_integer(Level), is_integer(Xoffset), is_integer(Yoffset), is_integer(Width), is_integer(Height), is_integer(Format), is_integer(ImageSize) ->
        (get({get({This, gl10}), '$class'})):glCompressedTexSubImage2D(get({This, gl10}), Target, Level, Xoffset, Yoffset, Width, Height, Format, ImageSize, Data).

glCopyTexImage2D(This, Target, Level, Internalformat, X, Y, Width, Height, Border) when is_integer(Target), is_integer(Level), is_integer(Internalformat), is_integer(X), is_integer(Y), is_integer(Width), is_integer(Height), is_integer(Border) ->
        (get({get({This, gl10}), '$class'})):glCopyTexImage2D(get({This, gl10}), Target, Level, Internalformat, X, Y, Width, Height, Border).

glCopyTexSubImage2D(This, Target, Level, Xoffset, Yoffset, X, Y, Width, Height) when is_integer(Target), is_integer(Level), is_integer(Xoffset), is_integer(Yoffset), is_integer(X), is_integer(Y), is_integer(Width), is_integer(Height) ->
        (get({get({This, gl10}), '$class'})):glCopyTexSubImage2D(get({This, gl10}), Target, Level, Xoffset, Yoffset, X, Y, Width, Height).

glCullFace(This, Mode) when is_integer(Mode) ->
        (get({get({This, gl10}), '$class'})):glCullFace(get({This, gl10}), Mode).

glDeleteTextures(This, N, Textures, Offset) when is_integer(N), (is_tuple(Textures) orelse Textures =:= undefined), is_integer(Offset) ->
        (get({get({This, gl10}), '$class'})):glDeleteTextures(get({This, gl10}), N, Textures, Offset).

glDeleteTextures(This, N, Textures) when is_integer(N) ->
        (get({get({This, gl10}), '$class'})):glDeleteTextures(get({This, gl10}), N, Textures).

glDepthFunc(This, Func) when is_integer(Func) ->
        (get({get({This, gl10}), '$class'})):glDepthFunc(get({This, gl10}), Func).

glDepthMask(This, Flag) when is_boolean(Flag) ->
        (get({get({This, gl10}), '$class'})):glDepthMask(get({This, gl10}), Flag).

glDepthRangef(This, ZNear, ZFar) when is_number(ZNear), is_number(ZFar) ->
        (get({get({This, gl10}), '$class'})):glDepthRangef(get({This, gl10}), ZNear, ZFar).

glDisable(This, Cap) when is_integer(Cap) ->
        (get({get({This, gl10}), '$class'})):glDisable(get({This, gl10}), Cap).

glDisableClientState(This, Array) when is_integer(Array) ->
        (get({get({This, gl10}), '$class'})):glDisableClientState(get({This, gl10}), Array).

glDrawArrays(This, Mode, First, Count) when is_integer(Mode), is_integer(First), is_integer(Count) ->
        (get({get({This, gl10}), '$class'})):glDrawArrays(get({This, gl10}), Mode, First, Count).

glDrawElements(This, Mode, Count, Type, Indices) when is_integer(Mode), is_integer(Count), is_integer(Type) ->
        (get({get({This, gl10}), '$class'})):glDrawElements(get({This, gl10}), Mode, Count, Type, Indices).

glEnable(This, Cap) when is_integer(Cap) ->
        (get({get({This, gl10}), '$class'})):glEnable(get({This, gl10}), Cap).

glEnableClientState(This, Array) when is_integer(Array) ->
        (get({get({This, gl10}), '$class'})):glEnableClientState(get({This, gl10}), Array).

glFinish(This) ->
        (get({get({This, gl10}), '$class'})):glFinish(get({This, gl10})).

glFlush(This) ->
        (get({get({This, gl10}), '$class'})):glFlush(get({This, gl10})).

glFogf(This, Pname, Param) when is_integer(Pname), is_number(Param) ->
        (get({get({This, gl10}), '$class'})):glFogf(get({This, gl10}), Pname, Param).

glFogfv(This, Pname, Params, Offset) when is_integer(Pname), (is_tuple(Params) orelse Params =:= undefined), is_integer(Offset) ->
        (get({get({This, gl10}), '$class'})):glFogfv(get({This, gl10}), Pname, Params, Offset).

glFogfv(This, Pname, Params) when is_integer(Pname) ->
        (get({get({This, gl10}), '$class'})):glFogfv(get({This, gl10}), Pname, Params).

glFrontFace(This, Mode) when is_integer(Mode) ->
        (get({get({This, gl10}), '$class'})):glFrontFace(get({This, gl10}), Mode).

glFrustumf(This, Left, Right, Bottom, Top, ZNear, ZFar) when is_number(Left), is_number(Right), is_number(Bottom), is_number(Top), is_number(ZNear), is_number(ZFar) ->
        (get({get({This, gl10}), '$class'})):glFrustumf(get({This, gl10}), Left, Right, Bottom, Top, ZNear, ZFar).

glGenTextures(This, N, Textures, Offset) when is_integer(N), (is_tuple(Textures) orelse Textures =:= undefined), is_integer(Offset) ->
        (get({get({This, gl10}), '$class'})):glGenTextures(get({This, gl10}), N, Textures, Offset).

glGenTextures(This, N, Textures) when is_integer(N) ->
        (get({get({This, gl10}), '$class'})):glGenTextures(get({This, gl10}), N, Textures).

glGetError(This) ->
        (get({get({This, gl10}), '$class'})):glGetError(get({This, gl10})).

glGetIntegerv(This, Pname, Params, Offset) when is_integer(Pname), (is_tuple(Params) orelse Params =:= undefined), is_integer(Offset) ->
        (get({get({This, gl10}), '$class'})):glGetIntegerv(get({This, gl10}), Pname, Params, Offset).

glGetIntegerv(This, Pname, Params) when is_integer(Pname) ->
        (get({get({This, gl10}), '$class'})):glGetIntegerv(get({This, gl10}), Pname, Params).

glGetString(This, Name) when is_integer(Name) ->
        (get({get({This, gl10}), '$class'})):glGetString(get({This, gl10}), Name).

glHint(This, Target, Mode) when is_integer(Target), is_integer(Mode) ->
        (get({get({This, gl10}), '$class'})):glHint(get({This, gl10}), Target, Mode).

glLightModelf(This, Pname, Param) when is_integer(Pname), is_number(Param) ->
        (get({get({This, gl10}), '$class'})):glLightModelf(get({This, gl10}), Pname, Param).

glLightModelfv(This, Pname, Params, Offset) when is_integer(Pname), (is_tuple(Params) orelse Params =:= undefined), is_integer(Offset) ->
        (get({get({This, gl10}), '$class'})):glLightModelfv(get({This, gl10}), Pname, Params, Offset).

glLightModelfv(This, Pname, Params) when is_integer(Pname) ->
        (get({get({This, gl10}), '$class'})):glLightModelfv(get({This, gl10}), Pname, Params).

glLightf(This, Light, Pname, Param) when is_integer(Light), is_integer(Pname), is_number(Param) ->
        (get({get({This, gl10}), '$class'})):glLightf(get({This, gl10}), Light, Pname, Param).

glLightfv(This, Light, Pname, Params, Offset) when is_integer(Light), is_integer(Pname), (is_tuple(Params) orelse Params =:= undefined), is_integer(Offset) ->
        (get({get({This, gl10}), '$class'})):glLightfv(get({This, gl10}), Light, Pname, Params, Offset).

glLightfv(This, Light, Pname, Params) when is_integer(Light), is_integer(Pname) ->
        (get({get({This, gl10}), '$class'})):glLightfv(get({This, gl10}), Light, Pname, Params).

glLineWidth(This, Width) when is_number(Width) ->
        (get({get({This, gl10}), '$class'})):glLineWidth(get({This, gl10}), Width).

glLoadIdentity(This) ->
        (get({get({This, gl10}), '$class'})):glLoadIdentity(get({This, gl10})).

glLoadMatrixf(This, M, Offset) when (is_tuple(M) orelse M =:= undefined), is_integer(Offset) ->
        (get({get({This, gl10}), '$class'})):glLoadMatrixf(get({This, gl10}), M, Offset).

glLoadMatrixf(This, M) ->
        (get({get({This, gl10}), '$class'})):glLoadMatrixf(get({This, gl10}), M).

glLogicOp(This, Opcode) when is_integer(Opcode) ->
        (get({get({This, gl10}), '$class'})):glLogicOp(get({This, gl10}), Opcode).

glMaterialf(This, Face, Pname, Param) when is_integer(Face), is_integer(Pname), is_number(Param) ->
        (get({get({This, gl10}), '$class'})):glMaterialf(get({This, gl10}), Face, Pname, Param).

glMaterialfv(This, Face, Pname, Params, Offset) when is_integer(Face), is_integer(Pname), (is_tuple(Params) orelse Params =:= undefined), is_integer(Offset) ->
        (get({get({This, gl10}), '$class'})):glMaterialfv(get({This, gl10}), Face, Pname, Params, Offset).

glMaterialfv(This, Face, Pname, Params) when is_integer(Face), is_integer(Pname) ->
        (get({get({This, gl10}), '$class'})):glMaterialfv(get({This, gl10}), Face, Pname, Params).

glMatrixMode(This, Mode) when is_integer(Mode) ->
        (get({get({This, gl10}), '$class'})):glMatrixMode(get({This, gl10}), Mode).

glMultMatrixf(This, M, Offset) when (is_tuple(M) orelse M =:= undefined), is_integer(Offset) ->
        (get({get({This, gl10}), '$class'})):glMultMatrixf(get({This, gl10}), M, Offset).

glMultMatrixf(This, M) ->
        (get({get({This, gl10}), '$class'})):glMultMatrixf(get({This, gl10}), M).

glMultiTexCoord4f(This, Target, S, T, R, Q) when is_integer(Target), is_number(S), is_number(T), is_number(R), is_number(Q) ->
        (get({get({This, gl10}), '$class'})):glMultiTexCoord4f(get({This, gl10}), Target, S, T, R, Q).

glNormal3f(This, Nx, Ny, Nz) when is_number(Nx), is_number(Ny), is_number(Nz) ->
        (get({get({This, gl10}), '$class'})):glNormal3f(get({This, gl10}), Nx, Ny, Nz).

glNormalPointer(This, Type, Stride, Pointer) when is_integer(Type), is_integer(Stride) ->
        (get({get({This, gl10}), '$class'})):glNormalPointer(get({This, gl10}), Type, Stride, Pointer).

glOrthof(This, Left, Right, Bottom, Top, ZNear, ZFar) when is_number(Left), is_number(Right), is_number(Bottom), is_number(Top), is_number(ZNear), is_number(ZFar) ->
        (get({get({This, gl10}), '$class'})):glOrthof(get({This, gl10}), Left, Right, Bottom, Top, ZNear, ZFar).

glPixelStorei(This, Pname, Param) when is_integer(Pname), is_integer(Param) ->
        (get({get({This, gl10}), '$class'})):glPixelStorei(get({This, gl10}), Pname, Param).

glPointSize(This, Size) when is_number(Size) ->
        (get({get({This, gl10}), '$class'})):glPointSize(get({This, gl10}), Size).

glPolygonOffset(This, Factor, Units) when is_number(Factor), is_number(Units) ->
        (get({get({This, gl10}), '$class'})):glPolygonOffset(get({This, gl10}), Factor, Units).

glPopMatrix(This) ->
        (get({get({This, gl10}), '$class'})):glPopMatrix(get({This, gl10})).

glPushMatrix(This) ->
        (get({get({This, gl10}), '$class'})):glPushMatrix(get({This, gl10})).

glReadPixels(This, X, Y, Width, Height, Format, Type, Pixels) when is_integer(X), is_integer(Y), is_integer(Width), is_integer(Height), is_integer(Format), is_integer(Type) ->
        (get({get({This, gl10}), '$class'})):glReadPixels(get({This, gl10}), X, Y, Width, Height, Format, Type, Pixels).

glRotatef(This, Angle, X, Y, Z) when is_number(Angle), is_number(X), is_number(Y), is_number(Z) ->
        (get({get({This, gl10}), '$class'})):glRotatef(get({This, gl10}), Angle, X, Y, Z).

glRotatex(This, Angle, X, Y, Z) when is_integer(Angle), is_integer(X), is_integer(Y), is_integer(Z) ->
        (get({get({This, gl10}), '$class'})):glRotatef(get({This, gl10}), Angle, X, Y, Z).

glSampleCoverage(This, Value, Invert) when is_number(Value), is_boolean(Invert) ->
        (get({get({This, gl10}), '$class'})):glSampleCoverage(get({This, gl10}), Value, Invert).

glScalef(This, X, Y, Z) when is_number(X), is_number(Y), is_number(Z) ->
        (get({get({This, gl10}), '$class'})):glScalef(get({This, gl10}), X, Y, Z).

glScalex(This, X, Y, Z) when is_integer(X), is_integer(Y), is_integer(Z) ->
        (get({get({This, gl10}), '$class'})):glScalef(get({This, gl10}), X, Y, Z).

glScissor(This, X, Y, Width, Height) when is_integer(X), is_integer(Y), is_integer(Width), is_integer(Height) ->
        (get({get({This, gl10}), '$class'})):glScissor(get({This, gl10}), X, Y, Width, Height).

glShadeModel(This, Mode) when is_integer(Mode) ->
        (get({get({This, gl10}), '$class'})):glShadeModel(get({This, gl10}), Mode).

glStencilFunc(This, Func, Ref, Mask) when is_integer(Func), is_integer(Ref), is_integer(Mask) ->
        (get({get({This, gl10}), '$class'})):glStencilFunc(get({This, gl10}), Func, Ref, Mask).

glStencilMask(This, Mask) when is_integer(Mask) ->
        (get({get({This, gl10}), '$class'})):glStencilMask(get({This, gl10}), Mask).

glStencilOp(This, Fail, Zfail, Zpass) when is_integer(Fail), is_integer(Zfail), is_integer(Zpass) ->
        (get({get({This, gl10}), '$class'})):glStencilOp(get({This, gl10}), Fail, Zfail, Zpass).

glTexCoordPointer(This, Size, Type, Stride, Pointer) when is_integer(Size), is_integer(Type), is_integer(Stride) ->
        (get({get({This, gl10}), '$class'})):glTexCoordPointer(get({This, gl10}), Size, Type, Stride, Pointer).

glTexEnvf(This, Target, Pname, Param) when is_integer(Target), is_integer(Pname), is_number(Param) ->
        (get({get({This, gl10}), '$class'})):glTexEnvf(get({This, gl10}), Target, Pname, Param).

glTexEnvfv(This, Target, Pname, Params, Offset) when is_integer(Target), is_integer(Pname), (is_tuple(Params) orelse Params =:= undefined), is_integer(Offset) ->
        (get({get({This, gl10}), '$class'})):glTexEnvfv(get({This, gl10}), Target, Pname, Params, Offset).

glTexEnvfv(This, Target, Pname, Params) when is_integer(Target), is_integer(Pname) ->
        (get({get({This, gl10}), '$class'})):glTexEnvfv(get({This, gl10}), Target, Pname, Params).

glTexImage2D(This, Target, Level, Internalformat, Width, Height, Border, Format, Type, Pixels) when is_integer(Target), is_integer(Level), is_integer(Internalformat), is_integer(Width), is_integer(Height), is_integer(Border), is_integer(Format), is_integer(Type) ->
        (get({get({This, gl10}), '$class'})):glTexImage2D(get({This, gl10}), Target, Level, Internalformat, Width, Height, Border, Format, Type, Pixels).

glTexParameterf(This, Target, Pname, Param) when is_integer(Target), is_integer(Pname), is_number(Param) ->
        (get({get({This, gl10}), '$class'})):glTexParameterf(get({This, gl10}), Target, Pname, Param).

glTexParameteri(This, Target, Pname, Param) when is_integer(Target), is_integer(Pname), is_integer(Param) ->
        (get({get({This, gl10}), '$class'})):glTexParameteri(get({This, gl10}), Target, Pname, Param).

glTexSubImage2D(This, Target, Level, Xoffset, Yoffset, Width, Height, Format, Type, Pixels) when is_integer(Target), is_integer(Level), is_integer(Xoffset), is_integer(Yoffset), is_integer(Width), is_integer(Height), is_integer(Format), is_integer(Type) ->
        (get({get({This, gl10}), '$class'})):glTexSubImage2D(get({This, gl10}), Target, Level, Xoffset, Yoffset, Width, Height, Format, Type, Pixels).

glTranslatef(This, X, Y, Z) when is_number(X), is_number(Y), is_number(Z) ->
        (get({get({This, gl10}), '$class'})):glTranslatef(get({This, gl10}), X, Y, Z).

glVertexPointer(This, Size, Type, Stride, Pointer) when is_integer(Size), is_integer(Type), is_integer(Stride) ->
        (get({get({This, gl10}), '$class'})):glVertexPointer(get({This, gl10}), Size, Type, Stride, Pointer).

glViewport(This, X, Y, Width, Height) when is_integer(X), is_integer(Y), is_integer(Width), is_integer(Height) ->
        (get({get({This, gl10}), '$class'})):glViewport(get({This, gl10}), X, Y, Width, Height).

glBegin(This, I) when is_integer(I) ->
        (get({get({This, gl10}), '$class'})):glBegin(get({This, gl10}), I).

glEnd(This) ->
        (get({get({This, gl10}), '$class'})):glEnd(get({This, gl10})).

glVertex3f(This, F, F2, F3) when is_number(F), is_number(F2), is_number(F3) ->
        (get({get({This, gl10}), '$class'})):glVertex3f(get({This, gl10}), F, F2, F3).

glPolygonMode(This, I, I1) when is_integer(I), is_integer(I1) ->
        (get({get({This, gl10}), '$class'})):glPolygonMode(get({This, gl10}), I, I1).

