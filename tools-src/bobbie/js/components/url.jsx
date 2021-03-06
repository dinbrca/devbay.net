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

var FindItemsAdvanced = React.createClass({

    render: function () {
        var href = this.props.url + '?' + this.props.params.join('&');
        var pre = this.props.url + '?\n    ' + this.props.params.join('\n    &');

        return (
            <div>
                <div className='row'>
                    <div className='large-12 columns'>
                        <label>
                            URL
                            <a className='url' href={href} target='_blank'>
                                {href}
                            </a>
                        </label>
                    </div>
                </div>
                <div className='row'>
                    <div className='large-12 columns'>
                        <pre>{pre}</pre>
                    </div>
                </div>
            </div>
        );
    }
});

module.exports = FindItemsAdvanced;
