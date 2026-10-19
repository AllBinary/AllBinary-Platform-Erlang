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

-module('Advertisement').
-compile([export_all, nowarn_export_all, nowarn_unused_vars, nowarn_shadow_vars]).
% implements AdvertisementInterface

init_fields(This) ->
    put({This, artist}, undefined),
    put({This, artistLink}, undefined),
    put({This, title}, undefined),
    put({This, dateAdded}, undefined),
    put({This, directory}, undefined),
    put({This, framedLink}, undefined),
    put({This, rank}, 0),
    put({This, listPrice}, undefined),
    put({This, ourPrice}, undefined),
    put({This, image}, undefined),
    put({This, product}, undefined),
    put({This, thumbnail}, undefined),
    put({This, displayInBrowserContraintsInterface}, undefined),
    ok.


new() ->
    This = make_ref(),
    put({This, '$class'}, ?MODULE),
    init(This),
    This.

init(This) ->
    init_fields(This),
        put({This, displayInBrowserContraintsInterface}, undefined).

getArtist(This) ->
        get({This, artist}).

setArtist(This, Artist) when (is_list(Artist) orelse Artist =:= undefined) ->
        put({This, artist}, Artist).

getArtistLink(This) ->
        get({This, artistLink}).

setArtistLink(This, ArtistLink) when (is_list(ArtistLink) orelse ArtistLink =:= undefined) ->
        put({This, artistLink}, ArtistLink).

getTitle(This) ->
        get({This, title}).

setTitle(This, Title) when (is_list(Title) orelse Title =:= undefined) ->
        put({This, title}, Title).

getDateAdded(This) ->
        get({This, dateAdded}).

setDateAdded(This, DateAdded) when (is_list(DateAdded) orelse DateAdded =:= undefined) ->
        put({This, dateAdded}, DateAdded).

getDirectory(This) ->
        get({This, directory}).

setDirectory(This, Directory) when (is_list(Directory) orelse Directory =:= undefined) ->
        put({This, directory}, Directory).

getFramedLink(This) ->
        get({This, framedLink}).

setFramedLink(This, FramedLink) when (is_list(FramedLink) orelse FramedLink =:= undefined) ->
        put({This, framedLink}, FramedLink).

getListPrice(This) ->
        get({This, listPrice}).

setListPrice(This, ListPrice) ->
        put({This, listPrice}, ListPrice).

getOurPrice(This) ->
        get({This, ourPrice}).

setOurPrice(This, OurPrice) ->
        put({This, ourPrice}, OurPrice).

getRank(This) ->
        get({This, rank}).

setRank(This, Rank) when is_integer(Rank) ->
        put({This, rank}, Rank).

getImage(This) ->
        get({This, image}).

setImage(This, Image) ->
        put({This, image}, Image).

getProduct(This) ->
        get({This, product}).

setProduct(This, Product) ->
        put({This, product}, Product).

getThumbnail(This) ->
        get({This, thumbnail}).

setThumbnail(This, Thumbnail) ->
        put({This, thumbnail}, Thumbnail).

getDisplayInBrowserContraintsInterface(This) ->
        get({This, displayInBrowserContraintsInterface}).

