import {themes as prismThemes} from 'prism-react-renderer';
import type {Config} from '@docusaurus/types';
import type * as Preset from '@docusaurus/preset-classic';

const config: Config = {
  title: 'FPL',
  tagline: 'High-performance NetCDF processing in Fortran 90',
  favicon: 'img/FPLlogo.png',

  url: 'https://pimentafm.github.io',
  baseUrl: '/FortranProcessingLibrary/',

  organizationName: 'pimentafm',
  projectName: 'FortranProcessingLibrary',

  onBrokenLinks: 'throw',

  markdown: {
    hooks: {
      onBrokenMarkdownLinks: 'warn',
    },
  },

  i18n: {
    defaultLocale: 'en',
    locales: ['en'],
  },

  plugins: ['docusaurus-plugin-image-zoom'],

  presets: [
    [
      'classic',
      {
        docs: {
          sidebarPath: './sidebars.ts',
          editUrl:
            'https://github.com/pimentafm/FortranProcessingLibrary/tree/master/docs/',
        },
        theme: {
          customCss: './src/css/custom.css',
        },
      } satisfies Preset.Options,
    ],
  ],

  themeConfig: {
    colorMode: {
      defaultMode: 'light',
      disableSwitch: false,
      respectPrefersColorScheme: false,
    },
    docs: {
      sidebar: {
        hideable: true,
        autoCollapseCategories: true,
      },
    },
    navbar: {
      logo: {
        alt: 'FPL Logo',
        src: 'img/FPLlogo.png',
      },
      items: [
        {
          type: 'doc',
          docId: 'intro',
          position: 'left',
          label: 'Docs',
        },
        {
          type: 'doc',
          docId: 'getting-started',
          position: 'left',
          label: 'Getting Started',
        },
        {
          type: 'doc',
          docId: 'api/datatypes',
          position: 'left',
          label: 'API',
        },
        {
          type: 'doc',
          docId: 'examples/ex01',
          position: 'left',
          label: 'Examples',
        },
        {
          href: 'https://github.com/pimentafm/FortranProcessingLibrary',
          position: 'right',
          className: 'header-github-link',
          'aria-label': 'GitHub repository',
        },
      ],
    },
    footer: {
      style: 'dark',
      links: [
        {
          title: 'Learn',
          items: [
            {
              label: 'Introduction',
              to: '/docs/',
            },
            {
              label: 'Getting Started',
              to: '/docs/getting-started',
            },
            {
              label: 'User Manual',
              to: '/docs/user-manual/introduction',
            },
          ],
        },
        {
          title: 'Reference',
          items: [
            {
              label: 'API Reference',
              to: '/docs/api/datatypes',
            },
            {
              label: 'Examples',
              to: '/docs/examples/ex01',
            },
            {
              label: 'Contributing',
              to: '/docs/contributing',
            },
          ],
        },
        {
          title: 'Community',
          items: [
            {
              label: 'GitHub',
              href: 'https://github.com/pimentafm/FortranProcessingLibrary',
            },
            {
              label: 'Research Group',
              href: 'http://www.biosfera.dea.ufv.br',
            },
            {
              label: 'Federal University of Viçosa',
              href: 'https://www.ufv.br/',
            },
          ],
        },
      ],
      copyright: `Copyright © ${new Date().getFullYear()} Fernando Martins Pimenta — Licensed under GPLv3`,
    },
    prism: {
      theme: prismThemes.github,
      darkTheme: prismThemes.dracula,
      additionalLanguages: ['fortran', 'bash', 'makefile'],
    },
    tableOfContents: {
      minHeadingLevel: 2,
      maxHeadingLevel: 4,
    },
    zoom: {
      selector: '.markdown img',
      background: {
        light: 'rgba(255, 255, 255, 0.9)',
        dark: 'rgba(50, 50, 50, 0.9)',
      },
    },
  } satisfies Preset.ThemeConfig,
};

export default config;
