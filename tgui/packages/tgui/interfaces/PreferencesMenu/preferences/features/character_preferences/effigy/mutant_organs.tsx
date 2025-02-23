import {
  FeatureChoiced,
  FeatureChoicedServerData,
  FeatureValueProps,
} from '../../base';
import { FeatureDropdownInput } from '../../dropdowns';

export const heart_type: FeatureChoiced = {
  name: 'Variation: Heart',
  description: `
  Add a cybernetic liver to your character.
`,
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const lungs_type: FeatureChoiced = {
  name: 'Variation: Lungs',
  description: `
  Add cybernetic lungs to your character.
`,
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const liver_type: FeatureChoiced = {
  name: 'Variation: Liver',
  description: `
  Add a cybernetic liver to your character.
`,
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const stomach_type: FeatureChoiced = {
  name: 'Variation: Stomach',
  description: `
  Add a cybernetic stomach to your character.
`,
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const eyes_type: FeatureChoiced = {
  name: 'Variation: Eyes',
  description: `
  Add a cybernetic stomach to your character.
`,
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const tongue_type: FeatureChoiced = {
  name: 'Variation: Tongue',
  description: `
  Add a custom tongue to your character.
`,
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const breathing_tube: FeatureChoiced = {
  name: 'Variation: Breathing Tube',
  description: `
  Add a breathing tube to your character.
`,
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};
