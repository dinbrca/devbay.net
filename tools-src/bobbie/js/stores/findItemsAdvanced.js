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
var EventEmitter = require('events').EventEmitter;
var assign = require('object-assign');

var CHANGE_EVENT = 'change';

var productionUrl = 'http://svcs.ebay.com/services/search/FindingService/v1';
var sandboxUrl = 'http://svcs.sandbox.ebay.com/services/search/FindingService/v1';

var findItemsAdvanced = {
    affiliate: {
        customId: '',
        geoTargeting: '',
        networkId: '',
        trackingId: ''
    },
    aspectFilter: [{
        aspectName: '',
        aspectValueName: ['']
    }],
    buyerPostalCode: '',
    categoryId: [''],
    descriptionSearch: '',
    itemFilter: [{
        name: '',
        paramName: '',
        paramValue: '',
        value: ['']
    }],
    keywords: '',
    outputSelector: [''],
    paginationInput: {
        entriesPerPage: '',
        pageNumber: ''
    },
    sortOrder: ''
};

var operation = findItemsAdvanced;

var _values = {
    appId: '',
    environment: 'production',
    version: '1.13.0',
    site: 'EBAY-US',
    responseFormat: 'JSON',
    operation: operation
};

var _url = productionUrl;

function buildParams(values) {
    var params = [];

    params.push('SECURITY-APPNAME=' + _values.appId);
    params.push('OPERATION-NAME=findItemsAdvanced');
    params.push('SERVICE-VERSION=' + _values.version);
    params.push('GLOBAL-ID=' + _values.site);
    params.push('RESPONSE-DATA-FORMAT=' + _values.responseFormat);
    params.push('REST-PAYLOAD');

    params = params.concat(objToParams('', values.operation));

    return params;
}

function objToParams(currPath, values) {
    var params = [];

    Object.keys(values).forEach(function (prop) {
        var value = values[prop];
        var path = currPath ? currPath + '.' : currPath;

        path += prop;

        params = params.concat(valueToParam(path, value));
    });

    return params;
}

function valueToParam(path, value) {
    var param = [];

    if (Array.isArray(value)) {
        param = arrayToParams(path, value);
    } else if (typeof value === 'object') {
        param = objToParams(path, value);
    } else {
        param = nvPair(path, value);
    }

    return param;
}

function arrayToParams(currPath, collection) {
    var params = [];

    collection.forEach(function (value, index) {
        var path = currPath + '(' + index + ')';
        params = params.concat(valueToParam(path, value));
    });

    return params;
}

function nvPair(name, value) {
    return value ? [name + '=' + encodeURIComponent(value)] : [];
}

var store = assign({}, EventEmitter.prototype, {

    emitChange: function () {
        this.emit(CHANGE_EVENT);
    },

    addChangeListener: function (callback) {
        this.on(CHANGE_EVENT, callback);
    },

    removeChangeListener: function (callback) {
        this.removeListener(CHANGE_EVENT, callback);
    },

    getState: function () {
        return {
            values: _values,
            url: _url,
            params: buildParams(_values)
        };
    }

});

store.dispatchToken = dispatcher.register(function (action) {
    switch (action.actionType) {

    case CONSTS.CHANGE_APP_ID:
        _values.appId = action.appId;

        store.emitChange();
        break;

    case CONSTS.CHANGE_ENVIRONMENT:
        _values.environment = action.environment;
        _url = action.environment === 'production' ? productionUrl : sandboxUrl;

        store.emitChange();
        break;

    case CONSTS.CHANGE_VERSION:
        _values.version = action.version;

        store.emitChange();
        break;

    case CONSTS.CHANGE_SITE:
        _values.site = action.site;

        store.emitChange();
        break;

    case CONSTS.CHANGE_RESPONSE_FORMAT:
        _values.responseFormat = action.responseFormat;

        store.emitChange();
        break;

    case CONSTS.ADD_ASPECT_FILTER:
        operation.aspectFilter.push({
            aspectName: '',
            aspectValueName: ['']
        });

        store.emitChange();
        break;

    case CONSTS.REMOVE_ASPECT_FILTER:
        operation.aspectFilter = operation.aspectFilter.filter(function (aspectFilter, index) {
            return index != action.aspectFilterIndex;
        });

        store.emitChange();
        break;

    case CONSTS.CHANGE_ASPECT_NAME:
        operation.aspectFilter[action.aspectFilterIndex].aspectName = action.aspectName;

        store.emitChange();
        break;

    case CONSTS.ADD_ASPECT_VALUE_NAME:
        operation.aspectFilter[action.aspectFilterIndex].aspectValueName.push('');

        store.emitChange();
        break;

    case CONSTS.REMOVE_ASPECT_VALUE_NAME:
        var collection = operation.aspectFilter[action.aspectFilterIndex].aspectValueName;

        operation.aspectFilter[action.aspectFilterIndex].aspectValueName = collection.filter(function (aspectValueName, index) {
            return index != action.aspectValueNameIndex;
        });

        store.emitChange();
        break;

    case CONSTS.CHANGE_ASPECT_VALUE_NAME:
        operation.aspectFilter[action.aspectFilterIndex].aspectValueName[action.aspectValueNameIndex] = action.aspectValueName;

        store.emitChange();
        break;

    case CONSTS.ADD_CATEGORY_ID:
        operation.categoryId.push('');

        store.emitChange();
        break;

    case CONSTS.REMOVE_CATEGORY_ID:
        operation.categoryId = operation.categoryId.filter(function (categoryId, index) {
            return index != action.categoryIdIndex;
        });

        store.emitChange();
        break;

    case CONSTS.CHANGE_CATEGORY_ID:
        operation.categoryId[action.categoryIdIndex] = action.categoryId;

        store.emitChange();
        break;

    case CONSTS.CHANGE_DESCRIPTION_SEARCH:
        operation.descriptionSearch = action.descriptionSearch;

        store.emitChange();
        break;

    case CONSTS.ADD_ITEM_FILTER:
        operation.itemFilter.push({
            name: '',
            paramName: '',
            paramValue: '',
            value: ['']
        });

        store.emitChange();
        break;

    case CONSTS.REMOVE_ITEM_FILTER:
        operation.itemFilter = operation.itemFilter.filter(function (itemFilter, index) {
            return index != action.itemFilterIndex;
        });

        store.emitChange();
        break;

    case CONSTS.CHANGE_NAME:
        operation.itemFilter[action.itemFilterIndex].name = action.name;

        store.emitChange();
        break;

    case CONSTS.CHANGE_PARAM_NAME:
        operation.itemFilter[action.itemFilterIndex].paramName = action.paramName;

        store.emitChange();
        break;

    case CONSTS.CHANGE_PARAM_VALUE:
        operation.itemFilter[action.itemFilterIndex].paramValue = action.paramValue;

        store.emitChange();
        break;

    case CONSTS.ADD_VALUE:
        operation.itemFilter[action.itemFilterIndex].value.push('');

        store.emitChange();
        break;

    case CONSTS.REMOVE_VALUE:
        var collection = operation.itemFilter[action.itemFilterIndex].value;

        operation.itemFilter[action.itemFilterIndex].value = collection.filter(function (value, index) {
            return index != action.valueIndex;
        });

        store.emitChange();
        break;

    case CONSTS.CHANGE_VALUE:
        operation.itemFilter[action.itemFilterIndex].value[action.valueIndex] = action.value;

        store.emitChange();
        break;

    case CONSTS.CHANGE_KEYWORDS:
        operation.keywords = action.keywords;

        store.emitChange();
        break;

    case CONSTS.ADD_OUTPUT_SELECTOR:
        operation.outputSelector.push('');

        store.emitChange();
        break;

    case CONSTS.REMOVE_OUTPUT_SELECTOR:
        operation.outputSelector = operation.outputSelector.filter(function (outputSelector, index) {
            return index != action.outputSelectorIndex;
        });

        store.emitChange();
        break;

    case CONSTS.CHANGE_OUTPUT_SELECTOR:
        operation.outputSelector[action.outputSelectorIndex] = action.outputSelector;

        store.emitChange();
        break;

    case CONSTS.CHANGE_CUSTOM_ID:
        operation.affiliate.customId = action.customId;

        store.emitChange();
        break;

    case CONSTS.CHANGE_GEO_TARGETING:
        operation.affiliate.geoTargeting = action.geoTargeting;

        store.emitChange();
        break;

    case CONSTS.CHANGE_NETWORK_ID:
        operation.affiliate.networkId = action.networkId;

        store.emitChange();
        break;

    case CONSTS.CHANGE_TRACKING_ID:
        operation.affiliate.trackingId = action.trackingId;

        store.emitChange();
        break;

    case CONSTS.CHANGE_BUYER_POSTAL_CODE:
        operation.buyerPostalCode = action.buyerPostalCode;

        store.emitChange();
        break;

    case CONSTS.CHANGE_ENTRIES_PER_PAGE:
        operation.paginationInput.entriesPerPage = action.entriesPerPage;

        store.emitChange();
        break;

    case CONSTS.CHANGE_PAGE_NUMBER:
        operation.paginationInput.pageNumber = action.pageNumber;

        store.emitChange();
        break;

    case CONSTS.CHANGE_SORT_ORDER:
        operation.sortOrder = action.sortOrder;

        store.emitChange();
        break;

    default:
    }
});

module.exports = store;
