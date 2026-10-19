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
% package org.allbinary.business.advertisement

-module('AdvertisementsInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


add(This, AdvertisementInterface) ->
    erlang:error({abstract_method, add}).

get(This, Index) when is_integer(Index) ->
    erlang:error({abstract_method, get}).

getCurrentPageNum(This) ->
    erlang:error({abstract_method, getCurrentPageNum}).

getErrorDescription(This) ->
    erlang:error({abstract_method, getErrorDescription}).

getErrorNum(This) ->
    erlang:error({abstract_method, getErrorNum}).

getNumberOfPosters(This) ->
    erlang:error({abstract_method, getNumberOfPosters}).

getNumberOfProductsInPage(This) ->
    erlang:error({abstract_method, getNumberOfProductsInPage}).

getStatusCode(This) ->
    erlang:error({abstract_method, getStatusCode}).

getTotalNumberOfProducts(This) ->
    erlang:error({abstract_method, getTotalNumberOfProducts}).

isSearchValid(This) ->
    erlang:error({abstract_method, isSearchValid}).

setCurrentPageNum(This, CurrentPageNum) when is_integer(CurrentPageNum) ->
    erlang:error({abstract_method, setCurrentPageNum}).

setErrorDescription(This, ErrorDescription) when (is_list(ErrorDescription) orelse ErrorDescription =:= undefined) ->
    erlang:error({abstract_method, setErrorDescription}).

setErrorNum(This, ErrorNum) when (is_list(ErrorNum) orelse ErrorNum =:= undefined) ->
    erlang:error({abstract_method, setErrorNum}).

setNumberOfProductsInPage(This, NumberOfProductsInPage) when is_integer(NumberOfProductsInPage) ->
    erlang:error({abstract_method, setNumberOfProductsInPage}).

setStatusCode(This, StatusCode) when is_integer(StatusCode) ->
    erlang:error({abstract_method, setStatusCode}).

setTotalNumberOfProducts(This, TotalNumberOfProducts) when is_integer(TotalNumberOfProducts) ->
    erlang:error({abstract_method, setTotalNumberOfProducts}).

toString(This) ->
    erlang:error({abstract_method, toString}).

