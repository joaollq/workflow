/*
 * @(#)FileSubClasses.java
 *
 * Copyright 2009 Instituto Superior Tecnico
 * Founding Authors: Paulo Abrantes
 * 
 *      https://fenix-ashes.ist.utl.pt/
 * 
 *   This file is part of the Meta-Workflow Module.
 *
 *   The Meta-Workflow Module is free software: you can
 *   redistribute it and/or modify it under the terms of the GNU Lesser General
 *   Public License as published by the Free Software Foundation, either version 
 *   3 of the License, or (at your option) any later version.
 *
 *   The Meta-Workflow Module is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 *   GNU Lesser General Public License for more details.
 *
 *   You should have received a copy of the GNU Lesser General Public License
 *   along with the Meta-Workflow Module. If not, see <http://www.gnu.org/licenses/>.
 * 
 */
package module.metaWorkflow.presentationTier.renderers.providers;

import module.workflow.domain.ProcessFile;
import pt.ist.bennu.core.presentationTier.renderers.providers.AbstractDomainClassProvider;

/**
 * 
 * @author Luis Cruz
 * @author Paulo Abrantes
 * 
 */
public class FileSubClasses extends AbstractDomainClassProvider {

    @Override
    protected Class getSuperClass() {
        return ProcessFile.class;
    }

    @Override
    protected boolean shouldContainSuperClass() {
        return true;
    }

}
