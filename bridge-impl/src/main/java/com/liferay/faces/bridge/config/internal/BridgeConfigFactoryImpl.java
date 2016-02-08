/**
 * Copyright (c) 2000-2016 Liferay, Inc. All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.liferay.faces.bridge.config.internal;

import javax.portlet.PortletConfig;
import javax.portlet.PortletContext;

import com.liferay.faces.bridge.config.BridgeConfig;
import com.liferay.faces.bridge.config.BridgeConfigFactory;


/**
 * @author  Neil Griffin
 */
public class BridgeConfigFactoryImpl extends BridgeConfigFactory {

	// Private Constants
	private static final String BRIDGE_CONFIG = BridgeConfig.class.getName();

	@Override
	public BridgeConfig getBridgeConfig(PortletConfig portletConfig) {

		PortletContext portletContext = portletConfig.getPortletContext();
		BridgeConfig bridgeConfig = (BridgeConfig) portletContext.getAttribute(BRIDGE_CONFIG);

		if (bridgeConfig == null) {
			bridgeConfig = new BridgeConfigImpl(portletConfig);
			portletContext.setAttribute(BRIDGE_CONFIG, bridgeConfig);
		}

		return bridgeConfig;
	}

	public BridgeConfigFactory getWrapped() {

		// Since this is the factory instance provided by the bridge, it will never wrap another factory.
		return null;
	}
}
