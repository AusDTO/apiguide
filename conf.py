import sys
import os
import shlex

extensions = [
    'sphinxcontrib.spelling',
    'sphinxcontrib.httpdomain',
    'sphinx_rfc2119',
]
spelling_lang = 'en_AU'
spelling_show_suggestions = True
spelling_word_list_filename = 'spelling_wordlist.txt'
templates_path = ['_templates']
source_suffix = '.rst'
master_doc = 'index'
project = u'API Design Guide'
copyright = u'2015, AusDTO'
author = u'AusDTO'
version = '0.1'
release = '0.1'
language = None
exclude_patterns = ['_build', '**venv**']
pygments_style = 'sphinx'
todo_include_todos = False
html_theme = 'sphinx_rtd_theme'
html_static_path = ['_static']
htmlhelp_basename = 'APIDesignGuidedoc'
latex_elements = {
'papersize': 'a4paper',
}
latex_documents = [
  (master_doc, 'APIDesignGuide.tex', u'API Design Guide Documentation',
   u'AusDTO', 'manual'),
]
man_pages = [
    (master_doc, 'apidesignguide', u'API Design Guide Documentation',
     [author], 1)
]
texinfo_documents = [
  (master_doc, 'APIDesignGuide', u'API Design Guide Documentation',
   author, 'APIDesignGuide', 'One line description of project.',
   'Miscellaneous'),
]
