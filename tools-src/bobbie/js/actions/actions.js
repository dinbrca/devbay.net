/**
 * Copyright 2015 David T. Sadler
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
'use strict';

var dispatcher = require('../dispatcher/dispatcher.js');
var CONSTS = require('../constants/consts.js');

var actions = {
    changeAppId: function (appId) {
        dispatcher.dispatch({
            actionType: CONSTS.CHANGE_APP_ID,
            appId: appId
        });
    },

    changeEnvironment: function (environment) {
        dispatcher.dispatch({
            actionType: CONSTS.CHANGE_ENVIRONMENT,
            environment: environment
        });
    },

    changeVersion: function (version) {
        dispatcher.dispatch({
            actionType: CONSTS.CHANGE_VERSION,
            version: version
        });
    },

    changeSite: function (site) {
        dispatcher.dispatch({
            actionType: CONSTS.CHANGE_SITE,
            site: site
        });
    },

    changeResponseFormat: function (responseFormat) {
        dispatcher.dispatch({
            actionType: CONSTS.CHANGE_RESPONSE_FORMAT,
            responseFormat: responseFormat
        });
    },

    addAspectFilter: function () {
        dispatcher.dispatch({
            actionType: CONSTS.ADD_ASPECT_FILTER
        });
    },

    removeAspectFilter: function (aspectFilterIndex) {
        dispatcher.dispatch({
            actionType: CONSTS.REMOVE_ASPECT_FILTER,
            aspectFilterIndex: aspectFilterIndex
        });
    },

    changeAspectName: function (aspectFilterIndex, aspectName) {
        dispatcher.dispatch({
            actionType: CONSTS.CHANGE_ASPECT_NAME,
            aspectFilterIndex: aspectFilterIndex,
            aspectName: aspectName
        });
    },

    addAspectValueName: function (aspectFilterIndex) {
        dispatcher.dispatch({
            actionType: CONSTS.ADD_ASPECT_VALUE_NAME,
            aspectFilterIndex: aspectFilterIndex
        });
    },

    removeAspectValueName: function (aspectFilterIndex, aspectValueNameIndex) {
        dispatcher.dispatch({
            actionType: CONSTS.REMOVE_ASPECT_VALUE_NAME,
            aspectFilterIndex: aspectFilterIndex,
            aspectValueNameIndex: aspectValueNameIndex
        });
    },

    changeAspectValueName: function (aspectFilterIndex, aspectValueNameIndex, aspectValueName) {
        dispatcher.dispatch({
            actionType: CONSTS.CHANGE_ASPECT_VALUE_NAME,
            aspectFilterIndex: aspectFilterIndex,
            aspectValueNameIndex: aspectValueNameIndex,
            aspectValueName: aspectValueName
        });
    },

    addCategoryId: function (categoryId) {
        dispatcher.dispatch({
            actionType: CONSTS.ADD_CATEGORY_ID
        });
    },

    removeCategoryId: function (categoryIdIndex) {
        dispatcher.dispatch({
            actionType: CONSTS.REMOVE_CATEGORY_ID,
            categoryIdIndex: categoryIdIndex
        });
    },

    changeCategoryId: function (categoryIdIndex, categoryId) {
        dispatcher.dispatch({
            actionType: CONSTS.CHANGE_CATEGORY_ID,
            categoryIdIndex: categoryIdIndex,
            categoryId: categoryId
        });
    },

    changeDescriptionSearch: function (descriptionSearch) {
        dispatcher.dispatch({
            actionType: CONSTS.CHANGE_DESCRIPTION_SEARCH,
            descriptionSearch: descriptionSearch
        });
    },

    addItemFilter: function () {
        dispatcher.dispatch({
            actionType: CONSTS.ADD_ITEM_FILTER
        });
    },

    removeItemFilter: function (itemFilterIndex) {
        dispatcher.dispatch({
            actionType: CONSTS.REMOVE_ITEM_FILTER,
            itemFilterIndex: itemFilterIndex
        });
    },

    changeName: function (itemFilterIndex, name) {
        dispatcher.dispatch({
            actionType: CONSTS.CHANGE_NAME,
            itemFilterIndex: itemFilterIndex,
            name: name
        });
    },

    changeParamName: function (itemFilterIndex, paramName) {
        dispatcher.dispatch({
            actionType: CONSTS.CHANGE_PARAM_NAME,
            itemFilterIndex: itemFilterIndex,
            paramName: paramName
        });
    },

    changeParamValue: function (itemFilterIndex, paramValue) {
        dispatcher.dispatch({
            actionType: CONSTS.CHANGE_PARAM_VALUE,
            itemFilterIndex: itemFilterIndex,
            paramValue: paramValue
        });
    },

    addValue: function (itemFilterIndex) {
        dispatcher.dispatch({
            actionType: CONSTS.ADD_VALUE,
            itemFilterIndex: itemFilterIndex
        });
    },

    removeValue: function (itemFilterIndex, valueIndex) {
        dispatcher.dispatch({
            actionType: CONSTS.REMOVE_VALUE,
            itemFilterIndex: itemFilterIndex,
            valueIndex: valueIndex
        });
    },

    changeValue: function (itemFilterIndex, valueIndex, value) {
        dispatcher.dispatch({
            actionType: CONSTS.CHANGE_VALUE,
            itemFilterIndex: itemFilterIndex,
            valueIndex: valueIndex,
            value: value
        });
    },

    changeKeywords: function (keywords) {
        dispatcher.dispatch({
            actionType: CONSTS.CHANGE_KEYWORDS,
            keywords: keywords
        });
    },

    addOutputSelector: function (outputSelector) {
        dispatcher.dispatch({
            actionType: CONSTS.ADD_OUTPUT_SELECTOR
        });
    },

    removeOutputSelector: function (outputSelectorIndex) {
        dispatcher.dispatch({
            actionType: CONSTS.REMOVE_OUTPUT_SELECTOR,
            outputSelectorIndex: outputSelectorIndex
        });
    },

    changeOutputSelector: function (outputSelectorIndex, outputSelector) {
        dispatcher.dispatch({
            actionType: CONSTS.CHANGE_OUTPUT_SELECTOR,
            outputSelectorIndex: outputSelectorIndex,
            outputSelector: outputSelector
        });
    },

    changeCustomId: function (customId) {
        dispatcher.dispatch({
            actionType: CONSTS.CHANGE_CUSTOM_ID,
            customId: customId
        });
    },

    changeGeoTargeting: function (geoTargeting) {
        dispatcher.dispatch({
            actionType: CONSTS.CHANGE_GEO_TARGETING,
            geoTargeting: geoTargeting
        });
    },

    changeNetworkId: function (networkId) {
        dispatcher.dispatch({
            actionType: CONSTS.CHANGE_NETWORK_ID,
            networkId: networkId
        });
    },

    changeTrackingId: function (trackingId) {
        dispatcher.dispatch({
            actionType: CONSTS.CHANGE_TRACKING_ID,
            trackingId: trackingId
        });
    },

    changeBuyerPostalCode: function (buyerPostalCode) {
        dispatcher.dispatch({
            actionType: CONSTS.CHANGE_BUYER_POSTAL_CODE,
            buyerPostalCode: buyerPostalCode
        });
    },

    changeEntriesPerPage: function (entriesPerPage) {
        dispatcher.dispatch({
            actionType: CONSTS.CHANGE_ENTRIES_PER_PAGE,
            entriesPerPage: entriesPerPage
        });
    },

    changePageNumber: function (pageNumber) {
        dispatcher.dispatch({
            actionType: CONSTS.CHANGE_PAGE_NUMBER,
            pageNumber: pageNumber
        });
    },

    changeSortOrder: function (sortOrder) {
        dispatcher.dispatch({
            actionType: CONSTS.CHANGE_SORT_ORDER,
            sortOrder: sortOrder
        });
    },
};

module.exports = actions;
