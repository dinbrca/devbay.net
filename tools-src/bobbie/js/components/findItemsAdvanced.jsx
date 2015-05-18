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

var React = require('react');
var AppId = require('./appId.jsx');
var Environment = require('./environment.jsx');
var Version = require('./version.jsx');
var Site = require('./site.jsx');
var ResponseFormat = require('./responseFormat.jsx');
var Affiliate = require('./affiliate.jsx');
var AspectFilterCollection = require('./aspectFilterCollection.jsx');
var BuyerPostalCode = require('./buyerPostalCode.jsx');
var CategoryIdCollection = require('./categoryIdCollection.jsx');
var DescriptionSearch = require('./descriptionSearch.jsx');
var ItemFilterCollection = require('./itemFilterCollection.jsx');
var Keywords = require('./keywords.jsx');
var OutputSelectorCollection = require('./outputSelectorCollection.jsx');
var PaginationInput = require('./paginationInput.jsx');
var SortOrder = require('./sortOrder.jsx');

var FindItemsAdvanced = React.createClass({

    render: function () {
        return (
            <div>
                <div className='row'>
                    <div className='large-12 columns'>
                        <AppId value={this.props.values.appId}/>
                    </div>
                </div>
                <div className='row'>
                    <div className='medium-3 columns'>
                        <Environment value={this.props.values.environment}/>
                    </div>
                    <div className='medium-3 columns'>
                        <Version value={this.props.values.version}/>
                    </div>
                    <div className='medium-3 columns'>
                        <Site value={this.props.values.site}/>
                    </div>
                    <div className='medium-3 columns'>
                        <ResponseFormat value={this.props.values.responseFormat}/>
                    </div>
                </div>
                <div className='row'>
                    <div className='large-12 columns'>
                        <Affiliate values={this.props.values.operation.affiliate}/>
                    </div>
                </div>
                <div className='row'>
                    <div className='large-12 columns'>
                        <AspectFilterCollection collection={this.props.values.operation.aspectFilter}/>
                    </div>
                </div>
                <div className='row'>
                    <div className='large-12 columns'>
                        <BuyerPostalCode values={this.props.values.operation.buyerPostalCode}/>
                    </div>
                </div>
                <div className='row'>
                    <div className='large-12 columns'>
                        <CategoryIdCollection collection={this.props.values.operation.categoryId}/>
                    </div>
                </div>
                <div className='row'>
                    <div className='large-12 columns'>
                        <DescriptionSearch value={this.props.values.operation.descriptionSearch}/>
                    </div>
                </div>
                <div className='row'>
                    <div className='large-12 columns'>
                        <ItemFilterCollection collection={this.props.values.operation.itemFilter}/>
                    </div>
                </div>
                <div className='row'>
                    <div className='large-12 columns'>
                        <Keywords value={this.props.values.keywords}/>
                    </div>
                </div>
                <div className='row'>
                    <div className='large-12 columns'>
                        <OutputSelectorCollection collection={this.props.values.operation.outputSelector}/>
                    </div>
                </div>
                <div className='row'>
                    <div className='large-12 columns'>
                        <PaginationInput values={this.props.values.operation.paginationInput}/>
                    </div>
                </div>
                <div className='row'>
                    <div className='large-12 columns'>
                        <SortOrder value={this.props.values.sortOrder}/>
                    </div>
                </div>
            </div>
        );
    }
});

module.exports = FindItemsAdvanced;
