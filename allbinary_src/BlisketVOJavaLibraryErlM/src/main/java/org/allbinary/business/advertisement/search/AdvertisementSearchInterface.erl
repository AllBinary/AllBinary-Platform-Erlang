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
% package org.allbinary.business.advertisement.search
% import java.util.HashMap
% import org.allbinary.business.advertisement.search.category.AdvertisementCategoryInterface
% import org.allbinary.business.advertisement.search.website.AdvertisementWebsiteInterface
% import org.allbinary.logic.control.contraints.price.PriceConstraintInterface
% import org.allbinary.logic.control.contraints.size.TwoDimensionalConstraintInterface

-module('AdvertisementSearchInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


getWebSite(This) ->
    erlang:error({abstract_method, getWebSite}).

getCategory(This) ->
    erlang:error({abstract_method, getCategory}).

getSizeConstraints(This) ->
    erlang:error({abstract_method, getSizeConstraints}).

getPricingConstraints(This) ->
    erlang:error({abstract_method, getPricingConstraints}).

getPageNumber(This) ->
    erlang:error({abstract_method, getPageNumber}).

getProductsPerPage(This) ->
    erlang:error({abstract_method, getProductsPerPage}).

getSearchParams(This) ->
    erlang:error({abstract_method, getSearchParams}).

setCategory(This, AdvertisementCategoryInterface) ->
    erlang:error({abstract_method, setCategory}).

setSizeConstraints(This, TwoDimensionConstraintsInterface) ->
    erlang:error({abstract_method, setSizeConstraints}).

setPricingConstraints(This, PriceConstraintInterface) ->
    erlang:error({abstract_method, setPricingConstraints}).

setPageNumber(This, PageNumber) when is_integer(PageNumber) ->
    erlang:error({abstract_method, setPageNumber}).

setProductsPerPage(This, ProductsPerPage) when is_integer(ProductsPerPage) ->
    erlang:error({abstract_method, setProductsPerPage}).

setSearchParams(This, ColumnAndKeywordHashMap) ->
    erlang:error({abstract_method, setSearchParams}).

