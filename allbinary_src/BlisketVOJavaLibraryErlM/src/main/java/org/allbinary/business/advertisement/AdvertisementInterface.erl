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
% import org.allbinary.business.advertisement.image.AdvertisementImageInterface
% import org.allbinary.business.advertisement.product.AdvertisementProductInterface
% import org.allbinary.business.advertisement.thumbnail.AdvertisementThumbnailInterface
% import org.allbinary.business.user.commerce.money.Money
% import org.allbinary.logic.control.contraints.display.browser.DisplayInBrowserContraintsInterface

-module('AdvertisementInterface').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% Java interface


getArtist(This) ->
    erlang:error({abstract_method, getArtist}).

getArtistLink(This) ->
    erlang:error({abstract_method, getArtistLink}).

getTitle(This) ->
    erlang:error({abstract_method, getTitle}).

getDateAdded(This) ->
    erlang:error({abstract_method, getDateAdded}).

getDirectory(This) ->
    erlang:error({abstract_method, getDirectory}).

getFramedLink(This) ->
    erlang:error({abstract_method, getFramedLink}).

getListPrice(This) ->
    erlang:error({abstract_method, getListPrice}).

getOurPrice(This) ->
    erlang:error({abstract_method, getOurPrice}).

getRank(This) ->
    erlang:error({abstract_method, getRank}).

getImage(This) ->
    erlang:error({abstract_method, getImage}).

getProduct(This) ->
    erlang:error({abstract_method, getProduct}).

getThumbnail(This) ->
    erlang:error({abstract_method, getThumbnail}).

getDisplayInBrowserContraintsInterface(This) ->
    erlang:error({abstract_method, getDisplayInBrowserContraintsInterface}).

setArtist(This, Artist) when (is_list(Artist) orelse Artist =:= undefined) ->
    erlang:error({abstract_method, setArtist}).

setArtistLink(This, ArtistLink) when (is_list(ArtistLink) orelse ArtistLink =:= undefined) ->
    erlang:error({abstract_method, setArtistLink}).

setTitle(This, Title) when (is_list(Title) orelse Title =:= undefined) ->
    erlang:error({abstract_method, setTitle}).

setDateAdded(This, DateAdded) when (is_list(DateAdded) orelse DateAdded =:= undefined) ->
    erlang:error({abstract_method, setDateAdded}).

setDirectory(This, Directory) when (is_list(Directory) orelse Directory =:= undefined) ->
    erlang:error({abstract_method, setDirectory}).

setFramedLink(This, FramedLink) when (is_list(FramedLink) orelse FramedLink =:= undefined) ->
    erlang:error({abstract_method, setFramedLink}).

setRank(This, Rank) when is_integer(Rank) ->
    erlang:error({abstract_method, setRank}).

setImage(This, AdvertisementImageInterface) ->
    erlang:error({abstract_method, setImage}).

setProduct(This, AdvertisementProductInterface) ->
    erlang:error({abstract_method, setProduct}).

setThumbnail(This, AdvertisementThumbnailInterface) ->
    erlang:error({abstract_method, setThumbnail}).

