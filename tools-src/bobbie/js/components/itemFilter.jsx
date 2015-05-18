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
var Name = require('./name.jsx');
var ParamName = require('./paramName.jsx');
var ParamValue = require('./paramValue.jsx');
var ValueCollection = require('./valueCollection.jsx');

var ItemFilter = React.createClass({

    render: function () {
        return (
            <fieldSet>
                <legend>Item Filter</legend>
                <div className='row'>
                    <div className='small-12 columns'>
                        <Name index={this.props.index} value={this.props.values.name}/>
                    </div>
                </div>
                <div className='row'>
                    <div className='small-6 columns'>
                        <ParamName index={this.props.index} value={this.props.values.paramName}/>
                    </div>
                    <div className='small-6 columns'>
                        <ParamValue index={this.props.index} value={this.props.values.paramValue}/>
                    </div>
                </div>
                <div className='row'>
                    <div className='small-12 columns'>
                        <ValueCollection
                            itemFilterIndex={this.props.index}
                            collection={this.props.values.value}
                        />
                    </div>
                </div>
            </fieldSet>
        );
    }
});

module.exports = ItemFilter;
