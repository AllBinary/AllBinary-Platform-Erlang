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
% package org.allbinary.graphics.j2me.workarea.tools

-module('ToolJPanel').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('JPanel', Function, Arguments).

init_fields(This) ->
    put({This, arcJButton}, undefined),
    put({This, charJButton}, undefined),
    put({This, colorJList}, undefined),
    put({This, colorJPanel}, undefined),
    put({This, dottedArcJButton}, undefined),
    put({This, dottedFillArcJButton}, undefined),
    put({This, dottedFillRectJButton}, undefined),
    put({This, dottedFillRountRectJButton}, undefined),
    put({This, dottedLineJButton}, undefined),
    put({This, dottedRectButton}, undefined),
    put({This, fillArcJButton}, undefined),
    put({This, fillRectJButton}, undefined),
    put({This, fillRoundRectJButton}, undefined),
    put({This, imageJButton}, undefined),
    put({This, lineJButton}, undefined),
    put({This, rectJButton}, undefined),
    put({This, roundRectJButton}, undefined),
    put({This, stringJButton}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This),
    This.

'$init'(This) ->
    'JPanel':'$init'(This),
    init_fields(This),
        (get({This, '$class'})):initComponents(This).

initComponents(This) ->
        put({This, lineJButton}, 'JButton':new()),
        put({This, rectJButton}, 'JButton':new()),
        put({This, arcJButton}, 'JButton':new()),
        put({This, stringJButton}, 'JButton':new()),
        put({This, charJButton}, 'JButton':new()),
        put({This, roundRectJButton}, 'JButton':new()),
        put({This, imageJButton}, 'JButton':new()),
        put({This, fillArcJButton}, 'JButton':new()),
        put({This, fillRectJButton}, 'JButton':new()),
        put({This, fillRoundRectJButton}, 'JButton':new()),
        put({This, dottedLineJButton}, 'JButton':new()),
        put({This, dottedRectButton}, 'JButton':new()),
        put({This, dottedArcJButton}, 'JButton':new()),
        put({This, dottedFillRectJButton}, 'JButton':new()),
        put({This, dottedFillArcJButton}, 'JButton':new()),
        put({This, dottedFillRountRectJButton}, 'JButton':new()),
        put({This, colorJPanel}, 'JPanel':new()),
        put({This, colorJList}, 'JList':new()),
        (get({This, '$class'})):setLayout(This, 'GridLayout':new(17, 1)),
        (get({get({This, lineJButton}), '$class'})):setFont(get({This, lineJButton}), 'Font':new("Dialog", 0, 10)),
        (get({get({This, lineJButton}), '$class'})):setText(get({This, lineJButton}), 'LinesGraphicItem':getStaticName()),
        (get({get({This, lineJButton}), '$class'})):addMouseListener(get({This, lineJButton}), 'MouseAdapter':new() % Java anonymous class body: implement it as a module
%             ok % mouseClicked
),
        (get({This, '$class'})):add(This, get({This, lineJButton})),
        (get({get({This, rectJButton}), '$class'})):setFont(get({This, rectJButton}), 'Font':new("Dialog", 0, 10)),
        (get({get({This, rectJButton}), '$class'})):setText(get({This, rectJButton}), "Rect"),
        (get({get({This, rectJButton}), '$class'})):addMouseListener(get({This, rectJButton}), 'MouseAdapter':new() % Java anonymous class body: implement it as a module
%             ok % mouseClicked
),
        (get({This, '$class'})):add(This, get({This, rectJButton})),
        (get({get({This, arcJButton}), '$class'})):setFont(get({This, arcJButton}), 'Font':new("Dialog", 0, 10)),
        (get({get({This, arcJButton}), '$class'})):setText(get({This, arcJButton}), "Arc"),
        (get({get({This, arcJButton}), '$class'})):addMouseListener(get({This, arcJButton}), 'MouseAdapter':new() % Java anonymous class body: implement it as a module
%             ok % mousePressed
),
        (get({This, '$class'})):add(This, get({This, arcJButton})),
        (get({get({This, stringJButton}), '$class'})):setFont(get({This, stringJButton}), 'Font':new("Dialog", 0, 10)),
        (get({get({This, stringJButton}), '$class'})):setText(get({This, stringJButton}), "String"),
        (get({get({This, stringJButton}), '$class'})):addMouseListener(get({This, stringJButton}), 'MouseAdapter':new() % Java anonymous class body: implement it as a module
%             ok % mousePressed
),
        (get({This, '$class'})):add(This, get({This, stringJButton})),
        (get({get({This, charJButton}), '$class'})):setFont(get({This, charJButton}), 'Font':new("Dialog", 0, 10)),
        (get({get({This, charJButton}), '$class'})):setText(get({This, charJButton}), "Char"),
        (get({get({This, charJButton}), '$class'})):addMouseListener(get({This, charJButton}), 'MouseAdapter':new() % Java anonymous class body: implement it as a module
%             ok % mousePressed
),
        (get({This, '$class'})):add(This, get({This, charJButton})),
        (get({get({This, roundRectJButton}), '$class'})):setFont(get({This, roundRectJButton}), 'Font':new("Dialog", 0, 10)),
        (get({get({This, roundRectJButton}), '$class'})):setText(get({This, roundRectJButton}), "Round Rect"),
        (get({get({This, roundRectJButton}), '$class'})):addMouseListener(get({This, roundRectJButton}), 'MouseAdapter':new() % Java anonymous class body: implement it as a module
%             ok % mousePressed
),
        (get({This, '$class'})):add(This, get({This, roundRectJButton})),
        (get({get({This, imageJButton}), '$class'})):setFont(get({This, imageJButton}), 'Font':new("Dialog", 0, 10)),
        (get({get({This, imageJButton}), '$class'})):setText(get({This, imageJButton}), "Image"),
        (get({get({This, imageJButton}), '$class'})):addMouseListener(get({This, imageJButton}), 'MouseAdapter':new() % Java anonymous class body: implement it as a module
%             ok % mousePressed
),
        (get({This, '$class'})):add(This, get({This, imageJButton})),
        (get({get({This, fillArcJButton}), '$class'})):setFont(get({This, fillArcJButton}), 'Font':new("Dialog", 0, 10)),
        (get({get({This, fillArcJButton}), '$class'})):setText(get({This, fillArcJButton}), "Fill Arc"),
        (get({get({This, fillArcJButton}), '$class'})):addMouseListener(get({This, fillArcJButton}), 'MouseAdapter':new() % Java anonymous class body: implement it as a module
%             ok % mousePressed
),
        (get({This, '$class'})):add(This, get({This, fillArcJButton})),
        (get({get({This, fillRectJButton}), '$class'})):setFont(get({This, fillRectJButton}), 'Font':new("Dialog", 0, 10)),
        (get({get({This, fillRectJButton}), '$class'})):setText(get({This, fillRectJButton}), "Fill Rect"),
        (get({get({This, fillRectJButton}), '$class'})):addMouseListener(get({This, fillRectJButton}), 'MouseAdapter':new() % Java anonymous class body: implement it as a module
%             ok % mousePressed
),
        (get({This, '$class'})):add(This, get({This, fillRectJButton})),
        (get({get({This, fillRoundRectJButton}), '$class'})):setFont(get({This, fillRoundRectJButton}), 'Font':new("Dialog", 0, 10)),
        (get({get({This, fillRoundRectJButton}), '$class'})):setText(get({This, fillRoundRectJButton}), "Fill Rnd Rect"),
        (get({get({This, fillRoundRectJButton}), '$class'})):addMouseListener(get({This, fillRoundRectJButton}), 'MouseAdapter':new() % Java anonymous class body: implement it as a module
%             ok % mousePressed
),
        (get({This, '$class'})):add(This, get({This, fillRoundRectJButton})),
        (get({get({This, dottedLineJButton}), '$class'})):setFont(get({This, dottedLineJButton}), 'Font':new("Dialog", 0, 10)),
        (get({get({This, dottedLineJButton}), '$class'})):setText(get({This, dottedLineJButton}), "Dot Line"),
        (get({get({This, dottedLineJButton}), '$class'})):addMouseListener(get({This, dottedLineJButton}), 'MouseAdapter':new() % Java anonymous class body: implement it as a module
%             ok % mousePressed
),
        (get({This, '$class'})):add(This, get({This, dottedLineJButton})),
        (get({get({This, dottedRectButton}), '$class'})):setFont(get({This, dottedRectButton}), 'Font':new("Dialog", 0, 10)),
        (get({get({This, dottedRectButton}), '$class'})):setText(get({This, dottedRectButton}), "Dot Rect"),
        (get({get({This, dottedRectButton}), '$class'})):addMouseListener(get({This, dottedRectButton}), 'MouseAdapter':new() % Java anonymous class body: implement it as a module
%             ok % mousePressed
),
        (get({This, '$class'})):add(This, get({This, dottedRectButton})),
        (get({get({This, dottedArcJButton}), '$class'})):setFont(get({This, dottedArcJButton}), 'Font':new("Dialog", 0, 10)),
        (get({get({This, dottedArcJButton}), '$class'})):setText(get({This, dottedArcJButton}), "Dot Arc"),
        (get({get({This, dottedArcJButton}), '$class'})):addMouseListener(get({This, dottedArcJButton}), 'MouseAdapter':new() % Java anonymous class body: implement it as a module
%             ok % mousePressed
),
        (get({This, '$class'})):add(This, get({This, dottedArcJButton})),
        (get({get({This, dottedFillRectJButton}), '$class'})):setFont(get({This, dottedFillRectJButton}), 'Font':new("Dialog", 0, 10)),
        (get({get({This, dottedFillRectJButton}), '$class'})):setText(get({This, dottedFillRectJButton}), "Dot Fill Rect"),
        (get({get({This, dottedFillRectJButton}), '$class'})):addMouseListener(get({This, dottedFillRectJButton}), 'MouseAdapter':new() % Java anonymous class body: implement it as a module
%             ok % mousePressed
),
        (get({This, '$class'})):add(This, get({This, dottedFillRectJButton})),
        (get({get({This, dottedFillArcJButton}), '$class'})):setFont(get({This, dottedFillArcJButton}), 'Font':new("Dialog", 0, 10)),
        (get({get({This, dottedFillArcJButton}), '$class'})):setText(get({This, dottedFillArcJButton}), "Dot Fill Arc"),
        (get({get({This, dottedFillArcJButton}), '$class'})):addMouseListener(get({This, dottedFillArcJButton}), 'MouseAdapter':new() % Java anonymous class body: implement it as a module
%             ok % mousePressed
),
        (get({This, '$class'})):add(This, get({This, dottedFillArcJButton})),
        (get({get({This, dottedFillRountRectJButton}), '$class'})):setFont(get({This, dottedFillRountRectJButton}), 'Font':new("Dialog", 0, 10)),
        (get({get({This, dottedFillRountRectJButton}), '$class'})):setText(get({This, dottedFillRountRectJButton}), "Dot Fill Rnd Rect"),
        (get({get({This, dottedFillRountRectJButton}), '$class'})):addMouseListener(get({This, dottedFillRountRectJButton}), 'MouseAdapter':new() % Java anonymous class body: implement it as a module
%             ok % mousePressed
),
        (get({This, '$class'})):add(This, get({This, dottedFillRountRectJButton})),
        (get({get({This, colorJPanel}), '$class'})):setLayout(get({This, colorJPanel}), 'GridLayout':new(1, 1)),
        (get({get({This, colorJPanel}), '$class'})):add(get({This, colorJPanel}), get({This, colorJList})),
        (get({This, '$class'})):add(This, get({This, colorJPanel})).

dottedFillRountRectJButtonMousePressed(This, Evt) ->
        (fun(Target_N71259) -> (get({Target_N71259, '$class'})):setSelectedTool(Target_N71259, (get({get({This, dottedFillRountRectJButton}), '$class'})):getText(get({This, dottedFillRountRectJButton}))) end)('ToolFactory':getInstance()).

dottedFillArcJButtonMousePressed(This, Evt) ->
        (fun(Target_N71400) -> (get({Target_N71400, '$class'})):setSelectedTool(Target_N71400, (get({get({This, dottedFillArcJButton}), '$class'})):getText(get({This, dottedFillArcJButton}))) end)('ToolFactory':getInstance()).

dottedFillRectJButtonMousePressed(This, Evt) ->
        (fun(Target_N71541) -> (get({Target_N71541, '$class'})):setSelectedTool(Target_N71541, (get({get({This, dottedFillRectJButton}), '$class'})):getText(get({This, dottedFillRectJButton}))) end)('ToolFactory':getInstance()).

dottedArcJButtonMousePressed(This, Evt) ->
        (fun(Target_N71682) -> (get({Target_N71682, '$class'})):setSelectedTool(Target_N71682, (get({get({This, dottedArcJButton}), '$class'})):getText(get({This, dottedArcJButton}))) end)('ToolFactory':getInstance()).

dottedRectButtonMousePressed(This, Evt) ->
        (fun(Target_N71823) -> (get({Target_N71823, '$class'})):setSelectedTool(Target_N71823, (get({get({This, dottedRectButton}), '$class'})):getText(get({This, dottedRectButton}))) end)('ToolFactory':getInstance()).

dottedLineJButtonMousePressed(This, Evt) ->
        (fun(Target_N71964) -> (get({Target_N71964, '$class'})):setSelectedTool(Target_N71964, (get({get({This, dottedLineJButton}), '$class'})):getText(get({This, dottedLineJButton}))) end)('ToolFactory':getInstance()).

fillRoundRectJButtonMousePressed(This, Evt) ->
        (fun(Target_N72105) -> (get({Target_N72105, '$class'})):setSelectedTool(Target_N72105, (get({get({This, fillRoundRectJButton}), '$class'})):getText(get({This, fillRoundRectJButton}))) end)('ToolFactory':getInstance()).

fillRectJButtonMousePressed(This, Evt) ->
        (fun(Target_N72246) -> (get({Target_N72246, '$class'})):setSelectedTool(Target_N72246, (get({get({This, fillRectJButton}), '$class'})):getText(get({This, fillRectJButton}))) end)('ToolFactory':getInstance()).

fillArcJButtonMousePressed(This, Evt) ->
        (fun(Target_N72387) -> (get({Target_N72387, '$class'})):setSelectedTool(Target_N72387, (get({get({This, fillArcJButton}), '$class'})):getText(get({This, fillArcJButton}))) end)('ToolFactory':getInstance()).

imageJButtonMousePressed(This, Evt) ->
        (fun(Target_N72528) -> (get({Target_N72528, '$class'})):setSelectedTool(Target_N72528, (get({get({This, imageJButton}), '$class'})):getText(get({This, imageJButton}))) end)('ToolFactory':getInstance()).

roundRectJButtonMousePressed(This, Evt) ->
        (fun(Target_N72669) -> (get({Target_N72669, '$class'})):setSelectedTool(Target_N72669, (get({get({This, roundRectJButton}), '$class'})):getText(get({This, roundRectJButton}))) end)('ToolFactory':getInstance()).

charJButtonMousePressed(This, Evt) ->
        (fun(Target_N72810) -> (get({Target_N72810, '$class'})):setSelectedTool(Target_N72810, (get({get({This, charJButton}), '$class'})):getText(get({This, charJButton}))) end)('ToolFactory':getInstance()).

stringJButtonMousePressed(This, Evt) ->
        (fun(Target_N72951) -> (get({Target_N72951, '$class'})):setSelectedTool(Target_N72951, (get({get({This, stringJButton}), '$class'})):getText(get({This, stringJButton}))) end)('ToolFactory':getInstance()).

arcJButtonMousePressed(This, Evt) ->
        (fun(Target_N73092) -> (get({Target_N73092, '$class'})):setSelectedTool(Target_N73092, (get({get({This, arcJButton}), '$class'})):getText(get({This, arcJButton}))) end)('ToolFactory':getInstance()).

rectJButtonMouseClicked(This, Evt) ->
        (fun(Target_N73233) -> (get({Target_N73233, '$class'})):setSelectedTool(Target_N73233, (get({get({This, rectJButton}), '$class'})):getText(get({This, rectJButton}))) end)('ToolFactory':getInstance()).

lineJButtonMouseClicked(This, Evt) ->
        (fun(Target_N73374) -> (get({Target_N73374, '$class'})):setSelectedTool(Target_N73374, (get({get({This, lineJButton}), '$class'})):getText(get({This, lineJButton}))) end)('ToolFactory':getInstance()).

