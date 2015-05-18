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
var CustomId = require('./customId.jsx');
var GeoTargeting = require('./geoTargeting.jsx');
var NetworkId = require('./networkId.jsx');
var TrackingId = require('./trackingId.jsx');

var Affiliate = React.createClass({

    render: function () {
        return (
            <fieldSet>
                <legend>Affiliate</legend>
                <div className='row'>
                    <div className='small-6 columns'>
                        <CustomId value={this.props.values.customId}/>
                    </div>
                    <div className='small-6 columns'>
                        <GeoTargeting value={this.props.values.geoTargeting}/>
                    </div>
                </div>
                <div className='row'>
                    <div className='small-6 columns'>
                        <NetworkId value={this.props.values.networkId}/>
                    </div>
                    <div className='small-6 columns'>
                        <TrackingId value={this.props.values.trackingId}/>
                    </div>
                </div>
            </fieldSet>
        );
    }
});

module.exports = Affiliate;
