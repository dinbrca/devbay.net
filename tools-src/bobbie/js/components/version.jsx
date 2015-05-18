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

var Version = React.createClass({

    mixins: [PureRenderMixin],

    render: function () {
        return (
            <label>
                Version
                <select value={this.props.value} onChange={this._onChange}>
                    <option value="1.13.0">1.13.0</option>
                    <option value="1.12.0">1.12.0</option>
                    <option value="1.11.0">1.11.0</option>
                    <option value="1.10.0">1.10.0</option>
                </select>
            </label>
        );
    },

    _onChange: function (e) {
        appActions.changeVersion(e.target.value);
    }
});

module.exports = Version;
