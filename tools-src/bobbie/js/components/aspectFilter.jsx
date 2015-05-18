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
var AspectName = require('./aspectName.jsx');
var AspectValueNameCollection= require('./aspectValueNameCollection.jsx');

var AspectFilter = React.createClass({

    render: function () {
        return (
            <fieldSet>
                <legend>Aspect Filter</legend>
                <div className='row'>
                    <div className='small-12 columns'>
                        <AspectName index={this.props.index} value={this.props.values.aspectName}/>
                    </div>
                </div>
                <div className='row'>
                    <div className='small-12 columns'>
                        <AspectValueNameCollection
                            aspectFilterIndex={this.props.index}
                            collection={this.props.values.aspectValueName}
                        />
                    </div>
                </div>
            </fieldSet>
        );
    }
});

module.exports = AspectFilter;
