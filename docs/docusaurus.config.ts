import {themes as prismThemes} from 'prism-react-renderer';
import type {Config} from '@docusaurus/types';
import type * as Preset from '@docusaurus/preset-classic';

const config: Config = {
  title: 'FPL — Fortran Processing Library',
  tagline: 'NetCDF data processing library for Fortran 90',
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
    navbar: {
      title: '',
      logo: {
        alt: 'FPL Logo',
        src: 'img/FPLlogo.png',
      },
      items: [
        {
          type: 'doc',
          docId: 'getting-started',
          position: 'left',
          label: 'Getting Started',
        },
        {
          type: 'doc',
          docId: 'user-manual/introduction',
          position: 'left',
          label: 'User Manual',
        },
        {
          type: 'doc',
          docId: 'api/datatypes',
          position: 'left',
          label: 'API Reference',
        },
        {
          href: 'https://github.com/pimentafm/FortranProcessingLibrary',
          label: 'GitHub',
          position: 'right',
        },
      ],
    },
    footer: {
      style: 'dark',
      links: [
        {
          title: 'Documentation',
          items: [
            {
              label: 'Getting Started',
              to: '/docs/getting-started',
            },
            {
              label: 'User Manual',
              to: '/docs/user-manual/introduction',
            },
            {
              label: 'API Reference',
              to: '/docs/api/datatypes',
            },
          ],
        },
        {
          title: 'Examples',
          items: [
            {
              label: 'Code Examples',
              to: '/docs/examples/ex01',
            },
          ],
        },
        {
          title: 'Links',
          items: [
            {
              label: 'GitHub',
              href: 'https://github.com/pimentafm/FortranProcessingLibrary',
            },
            {
              label: 'Research Group',
              href: 'http://www.biosfera.dea.ufv.br',
            },
          ],
        },
      ],
      copyright: `Copyright © ${new Date().getFullYear()} Fernando Martins Pimenta — GPLv3 License`,
    },
    prism: {
      theme: prismThemes.github,
      darkTheme: prismThemes.dracula,
      additionalLanguages: ['fortran', 'bash', 'makefile'],
    },
  } satisfies Preset.ThemeConfig,
};

export default config;
