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
% package org.allbinary.logic.control.search

-module('SearchData').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
-on_load(static_init/0).

static_init() ->
    put({?MODULE, 'TOTAL_NUMBER_PAGES'}, "SEARCHDATA_TOTALNUMBEROFPAGES"),
    put({?MODULE, 'TOTAL_NUMBER_ITEMS_ON_THIS_PAGE'}, "SEARCHDATA_TOTALNUMBEROFITEMSONTHISPAGE"),
    put({?MODULE, 'TOTAL_NUMBER_ITEMS'}, "SEARCHDATA_TOTALNUMBEROFITEMS"),
    put({?MODULE, 'DEFAULT_PAGE_LENGTH'}, 10),
    put({?MODULE, 'GENERATESTATICPAGES'}, "Generate Static Pages"),
    put({?MODULE, 'SEARCHBYSUMMARY'}, "Search By Summary"),
    put({?MODULE, 'SEARCHBYDESCRIPTION'}, "Search By Description"),
    put({?MODULE, 'SEARCHBYCATEGORY'}, "Search By Category"),
    put({?MODULE, 'SEARCHCATEGORIES'}, "Search Categories"),
    put({?MODULE, 'FILENAME'}, "SEARCHDATA_BASEFILENAME"),
    put({?MODULE, 'COLUMNNAME'}, "COLUMN_NAME"),
    put({?MODULE, 'COLUMNVALUE'}, "COLUMN_VALUE"),
    put({?MODULE, 'PARAMS'}, "SEARCHDATA_PARAMS"),
    put({?MODULE, 'LENGTH'}, "SEARCHDATA_LENGTH"),
    put({?MODULE, 'ORDER'}, "SEARCHDATA_ORDER"),
    put({?MODULE, 'PAGE'}, "SEARCHDATA_PAGE"),
    put({?MODULE, 'FIELDS'}, "SEARCHDATA_FIELDS"),
    put({?MODULE, 'FIELD'}, "SEARCHDATA_FIELD"),
    put({?MODULE, 'SORTBY'}, "SEARCHDATA_SORTBY"),
    put({?MODULE, 'TYPE'}, "SEARCHDATA_TYPE"),
    put({?MODULE, 'PAGE_INFO'}, "pageInfo"),
    put({?MODULE, 'SEARCH'}, "search"),
    put({?MODULE, 'MAKEPUBLIC'}, "Make Public"),
    ok.

init_fields(This) ->
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        ok.

