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

var Site = React.createClass({

    mixins: [PureRenderMixin],

    render: function () {
        return (
            <label>
                Site
                <select value={this.props.value} onChange={this._onChange}>
                    <option value='EBAY-US'>United States</option>
                    <option value='EBAY-ENCA'>Canada (English)</option>
                    <option value='EBAY-GB'>UK</option>
                    <option value='EBAY-AU'>Australia</option>
                    <option value='EBAY-AT'>Austria</option>
                    <option value='EBAY-FRBE'>Belgium (French)</option>
                    <option value='EBAY-FR'>France</option>
                    <option value='EBAY-DE'>Germany</option>
                    <option value='EBAY-MOTOR'>Motors</option>
                    <option value='EBAY-IT'>Italy</option>
                    <option value='EBAY-NLBE'>Belgium (Dutch)</option>
                    <option value='EBAY-NL'>Netherlands</option>
                    <option value='EBAY-ES'>Spain</option>
                    <option value='EBAY-CH'>Switzerland</option>
                    <option value='EBAY-HK'>Hong Kong</option>
                    <option value='EBAY-IN'>India</option>
                    <option value='EBAY-IE'>Ireland</option>
                    <option value='EBAY-MY'>Malaysia</option>
                    <option value='EBAY-FRCA'>Canada (French)</option>
                    <option value='EBAY-PH'>Philippones</option>
                    <option value='EBAY-PL'>Poland</option>
                    <option value='EBAY-SG'>Singapore</option>
                </select>
            </label>
        );
    },

    _onChange: function (e) {
        appActions.changeSite(e.target.value);
    }
});

module.exports = Site;
