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
var PureRenderMixin = React.addons.PureRenderMixin;
var appActions = require('../actions/actions.js');

var Name = React.createClass({

    mixins: [PureRenderMixin],

    render: function () {
        return (
            <label>
                Name 
                <select value={this.props.value} onChange={this._onChange}>
                    <option value=''></option>
                    <option value='AuthorizedSellerOnly'>AuthorizedSellerOnly</option>
                    <option value='AvailableTo'>AvailableTo</option>
                    <option value='BestOfferOnly'>BestOfferOnly</option>
                    <option value='CharityOnly'>CharityOnly</option>
                    <option value='Condition'>Condition</option>
                    <option value='Currency'>Currency</option>
                    <option value='EndTimeFrom'>EndTimeFrom</option>
                    <option value='EndTimeTo'>EndTimeTo</option>
                    <option value='ExcludeAutoPay'>ExcludeAutoPay</option>
                    <option value='ExcludeCategory'>ExcludeCategory</option>
                    <option value='ExcludeSeller'>ExcludeSeller</option>
                    <option value='ExpeditedShippingType'>ExpeditedShippingType</option>
                    <option value='FeaturedOnly'>FeaturedOnly</option>
                    <option value='FeedbackScoreMax'>FeedbackScoreMax</option>
                    <option value='FeedbackScoreMin'>FeedbackScoreMin</option>
                    <option value='FreeShippingOnly'>FreeShippingOnly</option>
                    <option value='GetItFastOnly'>GetItFastOnly</option>
                    <option value='HideDuplicateItems'>HideDuplicateItems</option>
                    <option value='ListedIn'>ListedIn</option>
                    <option value='ListingType'>ListingType</option>
                    <option value='LocalPickupOnly'>LocalPickupOnly</option>
                    <option value='LocalSearchOnly'>LocalSearchOnly</option>
                    <option value='LocatedIn'>LocatedIn</option>
                    <option value='LotsOnly'>LotsOnly</option>
                    <option value='MaxBids'>MaxBids</option>
                    <option value='MaxDistance'>MaxDistance</option>
                    <option value='MaxHandlingTime'>MaxHandlingTime</option>
                    <option value='MaxPrice'>MaxPrice</option>
                    <option value='MaxQuantity'>MaxQuantity</option>
                    <option value='MinBids'>MinBids</option>
                    <option value='MinPrice'>MinPrice</option>
                    <option value='MinQuantity'>MinQuantity</option>
                    <option value='ModTimeFrom'>ModTimeFrom</option>
                    <option value='OutletSellerOnly'>OutletSellerOnly</option>
                    <option value='PaymentMethod'>PaymentMethod</option>
                    <option value='ReturnsAcceptedOnly'>ReturnsAcceptedOnly</option>
                    <option value='Seller'>Seller</option>
                    <option value='SellerBusinessType'>SellerBusinessType</option>
                    <option value='SoldItemsOnly'>SoldItemsOnly</option>
                    <option value='StartTimeFrom'>StartTimeFrom</option>
                    <option value='StartTimeTo'>StartTimeTo</option>
                    <option value='TopRatedSellerOnly'>TopRatedSellerOnly</option>
                    <option value='ValueBoxInventory'>ValueBoxInventory</option>
                    <option value='WorldOfGoodOnly'>WorldOfGoodOnly</option>
                </select>
            </label>
        );
    },

    _onChange: function (e) {
        appActions.changeName(this.props.index, e.target.value);
    }
});

module.exports = Name;
