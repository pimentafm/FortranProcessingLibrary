import type {SidebarsConfig} from '@docusaurus/plugin-content-docs';

const sidebars: SidebarsConfig = {
  docsSidebar: [
    'intro',
    'getting-started',
    {
      type: 'category',
      label: 'User Manual',
      items: [
        'user-manual/introduction',
        'user-manual/first-program',
        'user-manual/data-types',
        'user-manual/griddims',
        'user-manual/readgrid',
        'user-manual/gengrid',
        'user-manual/writegrid',
        'user-manual/setfillvalue',
        'user-manual/dealloc',
        'user-manual/fileutils',
      ],
    },
    {
      type: 'category',
      label: 'API Reference',
      items: [
        'api/datatypes',
        'api/interfaces',
        'api/constants',
        'api/griddims',
        'api/readgrid',
        'api/writegrid',
        'api/gengrid',
        'api/setfillvalue',
        'api/dealloc',
        'api/fileutils',
        'api/datetime',
        'api/checkerror',
      ],
    },
    {
      type: 'category',
      label: 'Examples',
      items: [
        'examples/ex01',
        'examples/ex02',
        'examples/ex03',
        'examples/ex04',
        'examples/ex05',
        'examples/ex06',
      ],
    },
    'contributing',
  ],
};

export default sidebars;
