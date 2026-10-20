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
% package org.allbinary.input.automation.actions.script.condition
% import org.allbinary.logic.communication.log.LogUtil
% import org.allbinary.logic.string.StringValidationUtil
% import org.allbinary.media.image.analysis.ColorRangeInterface
% import org.allbinary.string.CommonStrings

-module('ColorAtActionScriptConditionJPanel').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).

'$handle_undefined_function'(Function, Arguments) ->
    apply('JPanel', Function, Arguments).

init_fields(This) ->
    put({This, logUtil}, 'LogUtil':getInstance()),
    put({This, commonStrings}, 'CommonStrings':getInstance()),
    put({This, colorAtActionScriptConditionInterface}, undefined),
    put({This, blueJLabel}, undefined),
    put({This, colorAtActionJButton}, undefined),
    put({This, colorAtActionJDialog}, undefined),
    put({This, colorAtXJTextField}, undefined),
    put({This, colorAtYJTextField}, undefined),
    put({This, colorRangeJLabel}, undefined),
    put({This, greenJLabel}, undefined),
    put({This, jLabel1}, undefined),
    put({This, locationJLabel}, undefined),
    put({This, maxBlueJTextField}, undefined),
    put({This, maxGreenJTextField}, undefined),
    put({This, maxJLabel}, undefined),
    put({This, maxRedJTextField}, undefined),
    put({This, minBlueJTextField}, undefined),
    put({This, minGreenJTextField}, undefined),
    put({This, minJLabel}, undefined),
    put({This, minRedJTextField}, undefined),
    put({This, okJButton}, undefined),
    put({This, redJLabel}, undefined),
    put({This, titleJLabel}, undefined),
    put({This, xJLabel}, undefined),
    put({This, yJLabel}, undefined),
    ok.


new(ColorAtActionScriptConditionInterface) ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    '$init'(This, ColorAtActionScriptConditionInterface),
    This.

'$init'(This, ColorAtActionScriptConditionInterface) ->
    'JPanel':'$init'(This),
    init_fields(This),
        (get({get({This, logUtil}), '$class'})):putF(get({This, logUtil}), get({get({This, commonStrings}), 'START'}), This, get({get({This, commonStrings}), 'CONSTRUCTOR'})),
        (get({This, '$class'})):initComponents(This),
        put({This, colorAtActionScriptConditionInterface}, ColorAtActionScriptConditionInterface),
        (get({This, '$class'})):set(This).

set(This) ->
        ColorRangeInterface = (get({get({This, colorAtActionScriptConditionInterface}), '$class'})):getColorRangeInterface(get({This, colorAtActionScriptConditionInterface})),
        (fun(Target_N66112) -> (get({Target_N66112, '$class'})):setText(Target_N66112, allbinary_java:to_string((get({ColorRangeInterface, '$class'})):getMinRed(ColorRangeInterface))) end)((get({This, '$class'})):getMinRedJTextField(This)),
        (fun(Target_N66173) -> (get({Target_N66173, '$class'})):setText(Target_N66173, allbinary_java:to_string((get({ColorRangeInterface, '$class'})):getMaxRed(ColorRangeInterface))) end)((get({This, '$class'})):getMaxRedJTextField(This)),
        (fun(Target_N66234) -> (get({Target_N66234, '$class'})):setText(Target_N66234, allbinary_java:to_string((get({ColorRangeInterface, '$class'})):getMinGreen(ColorRangeInterface))) end)((get({This, '$class'})):getMinGreenJTextField(This)),
        (fun(Target_N66295) -> (get({Target_N66295, '$class'})):setText(Target_N66295, allbinary_java:to_string((get({ColorRangeInterface, '$class'})):getMaxGreen(ColorRangeInterface))) end)((get({This, '$class'})):getMaxGreenJTextField(This)),
        (fun(Target_N66356) -> (get({Target_N66356, '$class'})):setText(Target_N66356, allbinary_java:to_string((get({ColorRangeInterface, '$class'})):getMinBlue(ColorRangeInterface))) end)((get({This, '$class'})):getMinBlueJTextField(This)),
        (fun(Target_N66417) -> (get({Target_N66417, '$class'})):setText(Target_N66417, allbinary_java:to_string((get({ColorRangeInterface, '$class'})):getMaxBlue(ColorRangeInterface))) end)((get({This, '$class'})):getMaxBlueJTextField(This)),
        (fun(Target_N66478) -> (get({Target_N66478, '$class'})):setText(Target_N66478, allbinary_java:to_string(get({(get({get({This, colorAtActionScriptConditionInterface}), '$class'})):getPoint(get({This, colorAtActionScriptConditionInterface})), x}))) end)((get({This, '$class'})):getColorAtXJTextField(This)),
        (fun(Target_N66550) -> (get({Target_N66550, '$class'})):setText(Target_N66550, allbinary_java:to_string(get({(get({get({This, colorAtActionScriptConditionInterface}), '$class'})):getPoint(get({This, colorAtActionScriptConditionInterface})), y}))) end)((get({This, '$class'})):getColorAtYJTextField(This)),
        (get({get({This, colorAtActionScriptConditionInterface}), '$class'})):log(get({This, colorAtActionScriptConditionInterface})).

update(This) ->
        ColorRangeInterface = (get({get({This, colorAtActionScriptConditionInterface}), '$class'})):getColorRangeInterface(get({This, colorAtActionScriptConditionInterface})),
        (get({ColorRangeInterface, '$class'})):setMinRed(ColorRangeInterface, (fun(Target_N66733) -> (get({Target_N66733, '$class'})):intValue(Target_N66733) end)(allbinary_java:to_string((fun(Target_N66757) -> (get({Target_N66757, '$class'})):getText(Target_N66757) end)((get({This, '$class'})):getMinRedJTextField(This))))),
        (get({ColorRangeInterface, '$class'})):setMaxRed(ColorRangeInterface, (fun(Target_N66802) -> (get({Target_N66802, '$class'})):intValue(Target_N66802) end)(allbinary_java:to_string((fun(Target_N66826) -> (get({Target_N66826, '$class'})):getText(Target_N66826) end)((get({This, '$class'})):getMaxRedJTextField(This))))),
        (get({ColorRangeInterface, '$class'})):setMinGreen(ColorRangeInterface, (fun(Target_N66871) -> (get({Target_N66871, '$class'})):intValue(Target_N66871) end)(allbinary_java:to_string((fun(Target_N66895) -> (get({Target_N66895, '$class'})):getText(Target_N66895) end)((get({This, '$class'})):getMinGreenJTextField(This))))),
        (get({ColorRangeInterface, '$class'})):setMaxGreen(ColorRangeInterface, (fun(Target_N66940) -> (get({Target_N66940, '$class'})):intValue(Target_N66940) end)(allbinary_java:to_string((fun(Target_N66964) -> (get({Target_N66964, '$class'})):getText(Target_N66964) end)((get({This, '$class'})):getMaxGreenJTextField(This))))),
        (get({ColorRangeInterface, '$class'})):setMinBlue(ColorRangeInterface, (fun(Target_N67009) -> (get({Target_N67009, '$class'})):intValue(Target_N67009) end)(allbinary_java:to_string((fun(Target_N67033) -> (get({Target_N67033, '$class'})):getText(Target_N67033) end)((get({This, '$class'})):getMinBlueJTextField(This))))),
        (get({ColorRangeInterface, '$class'})):setMaxBlue(ColorRangeInterface, (fun(Target_N67078) -> (get({Target_N67078, '$class'})):intValue(Target_N67078) end)(allbinary_java:to_string((fun(Target_N67102) -> (get({Target_N67102, '$class'})):getText(Target_N67102) end)((get({This, '$class'})):getMaxBlueJTextField(This))))),
        XString = (fun(Target_N67138) -> (get({Target_N67138, '$class'})):getText(Target_N67138) end)((get({This, '$class'})):getColorAtXJTextField(This)),
        case ((not (fun(Target_N67184) -> (get({Target_N67184, '$class'})):isEmpty(Target_N67184, XString) end)('StringValidationUtil':getInstance())) andalso (fun(Target_N67220) -> (get({Target_N67220, '$class'})):isNumber(Target_N67220, XString) end)('StringValidationUtil':getInstance())) of
            true ->
            put({(get({get({This, colorAtActionScriptConditionInterface}), '$class'})):getPoint(get({This, colorAtActionScriptConditionInterface})), x}, list_to_integer(XString));
            false -> ok
        end,
        YString = (fun(Target_N67338) -> (get({Target_N67338, '$class'})):getText(Target_N67338) end)((get({This, '$class'})):getColorAtYJTextField(This)),
        case ((not (fun(Target_N67384) -> (get({Target_N67384, '$class'})):isEmpty(Target_N67384, YString) end)('StringValidationUtil':getInstance())) andalso (fun(Target_N67420) -> (get({Target_N67420, '$class'})):isNumber(Target_N67420, YString) end)('StringValidationUtil':getInstance())) of
            true ->
            put({(get({get({This, colorAtActionScriptConditionInterface}), '$class'})):getPoint(get({This, colorAtActionScriptConditionInterface})), y}, list_to_integer(XString));
            false -> ok
        end,
        (get({get({This, colorAtActionScriptConditionInterface}), '$class'})):log(get({This, colorAtActionScriptConditionInterface})).

getColorAtXJTextField(This) ->
        get({This, colorAtXJTextField}).

setColorAtXJTextField(This, ColorAtXJTextField) ->
        put({This, colorAtXJTextField}, ColorAtXJTextField).

getColorAtYJTextField(This) ->
        get({This, colorAtYJTextField}).

setColorAtYJTextField(This, ColorAtYJTextField) ->
        put({This, colorAtYJTextField}, ColorAtYJTextField).

getMaxBlueJTextField(This) ->
        get({This, maxBlueJTextField}).

setMaxBlueJTextField(This, MaxBlueJTextField) ->
        put({This, maxBlueJTextField}, MaxBlueJTextField).

getMaxGreenJTextField(This) ->
        get({This, maxGreenJTextField}).

setMaxGreenJTextField(This, MaxGreenJTextField) ->
        put({This, maxGreenJTextField}, MaxGreenJTextField).

getMaxRedJTextField(This) ->
        get({This, maxRedJTextField}).

setMaxRedJTextField(This, MaxRedJTextField) ->
        put({This, maxRedJTextField}, MaxRedJTextField).

getMinBlueJTextField(This) ->
        get({This, minBlueJTextField}).

setMinBlueJTextField(This, MinBlueJTextField) ->
        put({This, minBlueJTextField}, MinBlueJTextField).

getMinGreenJTextField(This) ->
        get({This, minGreenJTextField}).

setMinGreenJTextField(This, MinGreenJTextField) ->
        put({This, minGreenJTextField}, MinGreenJTextField).

getMinRedJTextField(This) ->
        get({This, minRedJTextField}).

setMinRedJTextField(This, MinRedJTextField) ->
        put({This, minRedJTextField}, MinRedJTextField).

getYJLabel(This) ->
        get({This, yJLabel}).

setYJLabel(This, YJLabel) ->
        put({This, yJLabel}, YJLabel).

getColorAtActionJDialog(This) ->
        get({This, colorAtActionJDialog}).

setColorAtActionJDialog(This, ColorAtActionJDialog) ->
        put({This, colorAtActionJDialog}, ColorAtActionJDialog).

initComponents(This) ->
        put({This, colorAtActionJDialog}, 'JDialog':new()),
        put({This, titleJLabel}, 'JLabel':new()),
        put({This, locationJLabel}, 'JLabel':new()),
        put({This, colorAtXJTextField}, 'JTextField':new()),
        put({This, xJLabel}, 'JLabel':new()),
        put({This, yJLabel}, 'JLabel':new()),
        put({This, colorAtYJTextField}, 'JTextField':new()),
        put({This, colorRangeJLabel}, 'JLabel':new()),
        put({This, redJLabel}, 'JLabel':new()),
        put({This, minJLabel}, 'JLabel':new()),
        put({This, maxJLabel}, 'JLabel':new()),
        put({This, greenJLabel}, 'JLabel':new()),
        put({This, blueJLabel}, 'JLabel':new()),
        put({This, minRedJTextField}, 'JTextField':new()),
        put({This, maxRedJTextField}, 'JTextField':new()),
        put({This, maxGreenJTextField}, 'JTextField':new()),
        put({This, minBlueJTextField}, 'JTextField':new()),
        put({This, maxBlueJTextField}, 'JTextField':new()),
        put({This, okJButton}, 'JButton':new()),
        put({This, minGreenJTextField}, 'JTextField':new()),
        put({This, colorAtActionJButton}, 'JButton':new()),
        put({This, jLabel1}, 'JLabel':new()),
        (get({get({This, colorAtActionJDialog}), '$class'})):setMinimumSize(get({This, colorAtActionJDialog}), 'Dimension':new(350, 250)),
        (get({get({This, titleJLabel}), '$class'})):setText(get({This, titleJLabel}), "              Color At Action Options            "),
        (get({get({This, locationJLabel}), '$class'})):setText(get({This, locationJLabel}), "Location:"),
        (get({get({This, xJLabel}), '$class'})):setText(get({This, xJLabel}), "X:"),
        (get({get({This, yJLabel}), '$class'})):setText(get({This, yJLabel}), "Y:"),
        (get({get({This, colorRangeJLabel}), '$class'})):setText(get({This, colorRangeJLabel}), "Color Range"),
        (get({get({This, redJLabel}), '$class'})):setText(get({This, redJLabel}), "Red:"),
        (get({get({This, minJLabel}), '$class'})):setText(get({This, minJLabel}), "Minimum"),
        (get({get({This, maxJLabel}), '$class'})):setText(get({This, maxJLabel}), "Maximum"),
        (get({get({This, greenJLabel}), '$class'})):setText(get({This, greenJLabel}), "Green:"),
        (get({get({This, blueJLabel}), '$class'})):setText(get({This, blueJLabel}), "Blue:"),
        (get({get({This, okJButton}), '$class'})):setText(get({This, okJButton}), "OK"),
        (get({get({This, okJButton}), '$class'})):addActionListener(get({This, okJButton}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        ColorAtActionJDialogLayout = 'GroupLayout':new((get({get({This, colorAtActionJDialog}), '$class'})):getContentPane(get({This, colorAtActionJDialog}))),
        (fun(Target_N70779) -> (get({Target_N70779, '$class'})):setLayout(Target_N70779, ColorAtActionJDialogLayout) end)((get({get({This, colorAtActionJDialog}), '$class'})):getContentPane(get({This, colorAtActionJDialog}))),
        (get({ColorAtActionJDialogLayout, '$class'})):setHorizontalGroup(ColorAtActionJDialogLayout, (fun(Target_N70838) -> (get({Target_N70838, '$class'})):addGroup(Target_N70838, (fun(Target_N70906) -> (get({Target_N70906, '$class'})):addGroup(Target_N70906, (fun(Target_N70939) -> (get({Target_N70939, '$class'})):addGroup(Target_N70939, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'TRAILING'}), (fun(Target_N73072) -> (get({Target_N73072, '$class'})):addGap(Target_N73072, 33, 33, 33) end)((fun(Target_N73079) -> (get({Target_N73079, '$class'})):addComponent(Target_N73079, get({This, titleJLabel})) end)((get({ColorAtActionJDialogLayout, '$class'})):createSequentialGroup(ColorAtActionJDialogLayout)))) end)((fun(Target_N70946) -> (get({Target_N70946, '$class'})):addGroup(Target_N70946, (fun(Target_N71014) -> (get({Target_N71014, '$class'})):addGap(Target_N71014, 22, 22, 22) end)((fun(Target_N71021) -> (get({Target_N71021, '$class'})):addGroup(Target_N71021, (fun(Target_N72240) -> (get({Target_N72240, '$class'})):addComponent(Target_N72240, get({This, colorAtYJTextField}), get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), 44, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N72247) -> (get({Target_N72247, '$class'})):addGroup(Target_N72247, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}), (fun(Target_N72494) -> (get({Target_N72494, '$class'})):addGroup(Target_N72494, (fun(Target_N72542) -> (get({Target_N72542, '$class'})):addComponent(Target_N72542, get({This, maxGreenJTextField}), get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'TRAILING'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), 43, get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N72549) -> (get({Target_N72549, '$class'})):addComponent(Target_N72549, get({This, maxRedJTextField}), get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'TRAILING'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), 43, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N72556) -> (get({Target_N72556, '$class'})):addComponent(Target_N72556, get({This, maxBlueJTextField}), get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'TRAILING'})) end)((get({ColorAtActionJDialogLayout, '$class'})):createParallelGroup(ColorAtActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}), false))))) end)((fun(Target_N72501) -> (get({Target_N72501, '$class'})):addGap(Target_N72501, 1, 1, 1) end)((get({ColorAtActionJDialogLayout, '$class'})):createSequentialGroup(ColorAtActionJDialogLayout)))) end)((fun(Target_N72254) -> (get({Target_N72254, '$class'})):addComponent(Target_N72254, get({This, maxJLabel}), get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({'Short', 'MAX_VALUE'})) end)((get({ColorAtActionJDialogLayout, '$class'})):createParallelGroup(ColorAtActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'TRAILING'})))))) end)((fun(Target_N71028) -> (get({Target_N71028, '$class'})):addGap(Target_N71028, 24, 24, 24) end)((fun(Target_N71035) -> (get({Target_N71035, '$class'})):addComponent(Target_N71035, get({This, yJLabel})) end)((fun(Target_N71042) -> (get({Target_N71042, '$class'})):addGap(Target_N71042, 6, 6, 6) end)((fun(Target_N71049) -> (get({Target_N71049, '$class'})):addGroup(Target_N71049, (fun(Target_N71074) -> (get({Target_N71074, '$class'})):addGroup(Target_N71074, (fun(Target_N71161) -> (get({Target_N71161, '$class'})):addGap(Target_N71161, 16, 16, 16) end)((fun(Target_N71168) -> (get({Target_N71168, '$class'})):addGroup(Target_N71168, (fun(Target_N71690) -> (get({Target_N71690, '$class'})):addComponent(Target_N71690, get({This, colorAtXJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), 40, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N71697) -> (get({Target_N71697, '$class'})):addComponent(Target_N71697, get({This, minRedJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), 40, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N71704) -> (get({Target_N71704, '$class'})):addComponent(Target_N71704, get({This, minJLabel}), get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'TRAILING'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({'Short', 'MAX_VALUE'})) end)((fun(Target_N71711) -> (get({Target_N71711, '$class'})):addComponent(Target_N71711, get({This, minGreenJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), 40, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N71718) -> (get({Target_N71718, '$class'})):addComponent(Target_N71718, get({This, minBlueJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), 40, get({'Short', 'MAX_VALUE'})) end)((get({ColorAtActionJDialogLayout, '$class'})):createParallelGroup(ColorAtActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))))))) end)((fun(Target_N71175) -> (get({Target_N71175, '$class'})):addGroup(Target_N71175, (fun(Target_N71200) -> (get({Target_N71200, '$class'})):addGroup(Target_N71200, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'TRAILING'}), (fun(Target_N71508) -> (get({Target_N71508, '$class'})):addGap(Target_N71508, 18, 18, 18) end)((fun(Target_N71515) -> (get({Target_N71515, '$class'})):addComponent(Target_N71515, get({This, xJLabel})) end)((fun(Target_N71522) -> (get({Target_N71522, '$class'})):addPreferredGap(Target_N71522, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({'Short', 'MAX_VALUE'})) end)((fun(Target_N71529) -> (get({Target_N71529, '$class'})):addComponent(Target_N71529, get({This, locationJLabel})) end)((get({ColorAtActionJDialogLayout, '$class'})):createSequentialGroup(ColorAtActionJDialogLayout)))))) end)((fun(Target_N71207) -> (get({Target_N71207, '$class'})):addGroup(Target_N71207, (fun(Target_N71279) -> (get({Target_N71279, '$class'})):addGap(Target_N71279, 29, 29, 29) end)((fun(Target_N71286) -> (get({Target_N71286, '$class'})):addGroup(Target_N71286, (fun(Target_N71311) -> (get({Target_N71311, '$class'})):addComponent(Target_N71311, get({This, colorRangeJLabel})) end)((fun(Target_N71318) -> (get({Target_N71318, '$class'})):addComponent(Target_N71318, get({This, redJLabel})) end)((fun(Target_N71325) -> (get({Target_N71325, '$class'})):addComponent(Target_N71325, get({This, greenJLabel})) end)((fun(Target_N71332) -> (get({Target_N71332, '$class'})):addComponent(Target_N71332, get({This, blueJLabel})) end)((get({ColorAtActionJDialogLayout, '$class'})):createParallelGroup(ColorAtActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}))))))) end)((get({ColorAtActionJDialogLayout, '$class'})):createSequentialGroup(ColorAtActionJDialogLayout)))) end)((get({ColorAtActionJDialogLayout, '$class'})):createParallelGroup(ColorAtActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}), false)))) end)((get({ColorAtActionJDialogLayout, '$class'})):createSequentialGroup(ColorAtActionJDialogLayout))))) end)((fun(Target_N71081) -> (get({Target_N71081, '$class'})):addComponent(Target_N71081, get({This, okJButton})) end)((get({ColorAtActionJDialogLayout, '$class'})):createParallelGroup(ColorAtActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'TRAILING'}))))) end)((get({ColorAtActionJDialogLayout, '$class'})):createSequentialGroup(ColorAtActionJDialogLayout)))))))) end)((get({ColorAtActionJDialogLayout, '$class'})):createParallelGroup(ColorAtActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}))))) end)((fun(Target_N70913) -> (get({Target_N70913, '$class'})):addContainerGap(Target_N70913) end)((get({ColorAtActionJDialogLayout, '$class'})):createSequentialGroup(ColorAtActionJDialogLayout)))) end)((get({ColorAtActionJDialogLayout, '$class'})):createParallelGroup(ColorAtActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({ColorAtActionJDialogLayout, '$class'})):setVerticalGroup(ColorAtActionJDialogLayout, (fun(Target_N73159) -> (get({Target_N73159, '$class'})):addGroup(Target_N73159, (fun(Target_N73227) -> (get({Target_N73227, '$class'})):addContainerGap(Target_N73227) end)((fun(Target_N73234) -> (get({Target_N73234, '$class'})):addGroup(Target_N73234, (fun(Target_N73337) -> (get({Target_N73337, '$class'})):addGroup(Target_N73337, (fun(Target_N74711) -> (get({Target_N74711, '$class'})):addComponent(Target_N74711, get({This, maxBlueJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N74718) -> (get({Target_N74718, '$class'})):addPreferredGap(Target_N74718, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N74725) -> (get({Target_N74725, '$class'})):addComponent(Target_N74725, get({This, maxGreenJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N74732) -> (get({Target_N74732, '$class'})):addPreferredGap(Target_N74732, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N74739) -> (get({Target_N74739, '$class'})):addComponent(Target_N74739, get({This, maxRedJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N74746) -> (get({Target_N74746, '$class'})):addPreferredGap(Target_N74746, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N74753) -> (get({Target_N74753, '$class'})):addComponent(Target_N74753, get({This, maxJLabel})) end)((fun(Target_N74760) -> (get({Target_N74760, '$class'})):addPreferredGap(Target_N74760, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N74767) -> (get({Target_N74767, '$class'})):addComponent(Target_N74767, get({This, colorAtYJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N74774) -> (get({Target_N74774, '$class'})):addGap(Target_N74774, 14, 14, 14) end)((get({ColorAtActionJDialogLayout, '$class'})):createSequentialGroup(ColorAtActionJDialogLayout)))))))))))) end)((fun(Target_N73344) -> (get({Target_N73344, '$class'})):addGroup(Target_N73344, (fun(Target_N73412) -> (get({Target_N73412, '$class'})):addComponent(Target_N73412, get({This, okJButton})) end)((fun(Target_N73419) -> (get({Target_N73419, '$class'})):addPreferredGap(Target_N73419, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'}), 17, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N73426) -> (get({Target_N73426, '$class'})):addGroup(Target_N73426, (fun(Target_N74436) -> (get({Target_N74436, '$class'})):addComponent(Target_N74436, get({This, minBlueJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N74443) -> (get({Target_N74443, '$class'})):addComponent(Target_N74443, get({This, blueJLabel})) end)((get({ColorAtActionJDialogLayout, '$class'})):createParallelGroup(ColorAtActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'BASELINE'}))))) end)((fun(Target_N73433) -> (get({Target_N73433, '$class'})):addPreferredGap(Target_N73433, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N73440) -> (get({Target_N73440, '$class'})):addGroup(Target_N73440, (fun(Target_N74195) -> (get({Target_N74195, '$class'})):addComponent(Target_N74195, get({This, minGreenJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N74202) -> (get({Target_N74202, '$class'})):addComponent(Target_N74202, get({This, greenJLabel})) end)((get({ColorAtActionJDialogLayout, '$class'})):createParallelGroup(ColorAtActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'BASELINE'}))))) end)((fun(Target_N73447) -> (get({Target_N73447, '$class'})):addPreferredGap(Target_N73447, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N73454) -> (get({Target_N73454, '$class'})):addGroup(Target_N73454, (fun(Target_N73954) -> (get({Target_N73954, '$class'})):addComponent(Target_N73954, get({This, redJLabel})) end)((fun(Target_N73961) -> (get({Target_N73961, '$class'})):addComponent(Target_N73961, get({This, minRedJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((get({ColorAtActionJDialogLayout, '$class'})):createParallelGroup(ColorAtActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'BASELINE'}))))) end)((fun(Target_N73461) -> (get({Target_N73461, '$class'})):addPreferredGap(Target_N73461, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N73468) -> (get({Target_N73468, '$class'})):addGroup(Target_N73468, (fun(Target_N73809) -> (get({Target_N73809, '$class'})):addComponent(Target_N73809, get({This, colorRangeJLabel})) end)((fun(Target_N73816) -> (get({Target_N73816, '$class'})):addComponent(Target_N73816, get({This, minJLabel})) end)((get({ColorAtActionJDialogLayout, '$class'})):createParallelGroup(ColorAtActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'BASELINE'}))))) end)((fun(Target_N73475) -> (get({Target_N73475, '$class'})):addPreferredGap(Target_N73475, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N73482) -> (get({Target_N73482, '$class'})):addGroup(Target_N73482, (fun(Target_N73530) -> (get({Target_N73530, '$class'})):addComponent(Target_N73530, get({This, yJLabel})) end)((fun(Target_N73537) -> (get({Target_N73537, '$class'})):addComponent(Target_N73537, get({This, colorAtXJTextField}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'DEFAULT_SIZE'}), get({get({get({'javax', swing}), 'GroupLayout'}), 'PREFERRED_SIZE'})) end)((fun(Target_N73544) -> (get({Target_N73544, '$class'})):addComponent(Target_N73544, get({This, locationJLabel})) end)((fun(Target_N73551) -> (get({Target_N73551, '$class'})):addComponent(Target_N73551, get({This, xJLabel})) end)((get({ColorAtActionJDialogLayout, '$class'})):createParallelGroup(ColorAtActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'BASELINE'}))))))) end)((fun(Target_N73489) -> (get({Target_N73489, '$class'})):addGap(Target_N73489, 15, 15, 15) end)((get({ColorAtActionJDialogLayout, '$class'})):createSequentialGroup(ColorAtActionJDialogLayout)))))))))))))) end)((get({ColorAtActionJDialogLayout, '$class'})):createParallelGroup(ColorAtActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'}))))) end)((fun(Target_N73241) -> (get({Target_N73241, '$class'})):addPreferredGap(Target_N73241, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'})) end)((fun(Target_N73248) -> (get({Target_N73248, '$class'})):addComponent(Target_N73248, get({This, titleJLabel})) end)((fun(Target_N73255) -> (get({Target_N73255, '$class'})):addContainerGap(Target_N73255) end)((get({ColorAtActionJDialogLayout, '$class'})):createSequentialGroup(ColorAtActionJDialogLayout))))))) end)((get({ColorAtActionJDialogLayout, '$class'})):createParallelGroup(ColorAtActionJDialogLayout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({This, '$class'})):setPreferredSize(This, 'Dimension':new(100, 0)),
        (get({get({This, colorAtActionJButton}), '$class'})):setText(get({This, colorAtActionJButton}), "Edit"),
        (get({get({This, colorAtActionJButton}), '$class'})):addActionListener(get({This, colorAtActionJButton}), 'ActionListener':new() % Java anonymous class body: implement it as a module
%             ok % actionPerformed
),
        (get({get({This, jLabel1}), '$class'})):setText(get({This, jLabel1}), "Color At:"),
        Layout = 'GroupLayout':new(This),
        (get({This, '$class'})):setLayout(This, Layout),
        (get({Layout, '$class'})):setHorizontalGroup(Layout, (fun(Target_N75837) -> (get({Target_N75837, '$class'})):addGroup(Target_N75837, (fun(Target_N75905) -> (get({Target_N75905, '$class'})):addComponent(Target_N75905, get({This, colorAtActionJButton})) end)((fun(Target_N75912) -> (get({Target_N75912, '$class'})):addPreferredGap(Target_N75912, get({get({get({get({'javax', swing}), 'LayoutStyle'}), 'ComponentPlacement'}), 'RELATED'}), 15, get({'Short', 'MAX_VALUE'})) end)((fun(Target_N75919) -> (get({Target_N75919, '$class'})):addComponent(Target_N75919, get({This, jLabel1})) end)((get({Layout, '$class'})):createSequentialGroup(Layout))))) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))),
        (get({Layout, '$class'})):setVerticalGroup(Layout, (fun(Target_N76055) -> (get({Target_N76055, '$class'})):addGroup(Target_N76055, (fun(Target_N76123) -> (get({Target_N76123, '$class'})):addComponent(Target_N76123, get({This, colorAtActionJButton})) end)((fun(Target_N76130) -> (get({Target_N76130, '$class'})):addComponent(Target_N76130, get({This, jLabel1})) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'BASELINE'}))))) end)((get({Layout, '$class'})):createParallelGroup(Layout, get({get({get({get({'javax', swing}), 'GroupLayout'}), 'Alignment'}), 'LEADING'})))).

okJButtonActionPerformed(This, Evt) ->
        (get({This, '$class'})):update(This),
        (fun(Target_N76276) -> (get({Target_N76276, '$class'})):setVisible(Target_N76276, false) end)((get({This, '$class'})):getColorAtActionJDialog(This)).

colorAtActionJButtonActionPerformed(This, Evt) ->
        (fun(Target_N76393) -> (get({Target_N76393, '$class'})):setVisible(Target_N76393, true) end)((get({This, '$class'})):getColorAtActionJDialog(This)).

