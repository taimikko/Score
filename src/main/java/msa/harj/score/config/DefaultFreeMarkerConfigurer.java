package msa.harj.score.config;

import org.springframework.web.servlet.view.freemarker.FreeMarkerConfigurer;

import freemarker.ext.jsp.TaglibFactory;

public class DefaultFreeMarkerConfigurer extends FreeMarkerConfigurer {
	@Override
	public TaglibFactory getTaglibFactory() {
		TaglibFactory tagLibFactory = super.getTaglibFactory();
		if (tagLibFactory.getObjectWrapper() == null) {
			tagLibFactory.setObjectWrapper(super.getConfiguration().getObjectWrapper());
		}
		return tagLibFactory;
	}
}
