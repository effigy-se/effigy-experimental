import {
  CheckboxInput,
  Feature,
  FeatureChoiced,
  FeatureChoicedServerData,
  FeatureToggle,
  FeatureTriColorInput,
  FeatureValueProps,
} from '../../base';
import { FeatureDropdownInput } from '../../dropdowns';

export const cosmetic_wings_enabled: FeatureToggle = {
  name: '+ Cosmetic Wings',
  category: 'GAMEPLAY',
  component: CheckboxInput,
};

export const feature_cosmetic_wings: FeatureChoiced = {
  name: 'Wings',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const fluff_enabled: FeatureToggle = {
  name: '+ Fluff',
  category: 'GAMEPLAY',
  component: CheckboxInput,
};

export const feature_neck_fluff: FeatureChoiced = {
  name: 'Neck Fluff',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const ears_enabled: FeatureToggle = {
  name: '+ Ears',
  category: 'GAMEPLAY',
  component: CheckboxInput,
};

export const ears_tri: Feature<string[]> = {
  name: 'Ear Color',
  component: FeatureTriColorInput,
};

export const frills_enabled: FeatureToggle = {
  name: '+ Frills',
  category: 'GAMEPLAY',
  component: CheckboxInput,
};

export const frills_tri: Feature<string[]> = {
  name: 'Frill Color',
  component: FeatureTriColorInput,
};

export const horns_enabled: FeatureToggle = {
  name: '+ Horns',
  category: 'GAMEPLAY',
  component: CheckboxInput,
};

export const horns_tri: Feature<string[]> = {
  name: 'Horn Color',
  component: FeatureTriColorInput,
};

export const moth_wings_enabled: FeatureToggle = {
  name: '+ Moth Wings',
  category: 'GAMEPLAY',
  component: CheckboxInput,
};

export const wings_tri: Feature<string[]> = {
  name: 'Wing Color',
  component: FeatureTriColorInput,
};

export const feature_moth_wings: FeatureChoiced = {
  name: 'Wings',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const snout_enabled: FeatureToggle = {
  name: '+ Snout',
  category: 'GAMEPLAY',
  component: CheckboxInput,
};

export const snout_tri: Feature<string[]> = {
  name: 'Snout Color',
  component: FeatureTriColorInput,
};

export const spines_enabled: FeatureToggle = {
  name: '+ Spines',
  category: 'GAMEPLAY',
  component: CheckboxInput,
};

export const feature_lizard_spines: FeatureChoiced = {
  name: 'Spines',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const spines_tri: Feature<string[]> = {
  name: 'Spine Color',
  component: FeatureTriColorInput,
};

export const tail_type: FeatureChoiced = {
  name: '+ Tail',
  category: 'GAMEPLAY',
  description: `
    Choose which tail to add to your character, if any.
  `,
  component: FeatureDropdownInput,
};

export const feature_tail_anthro: FeatureChoiced = {
  name: 'Tail',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const tail_tri: Feature<string[]> = {
  name: 'Tail Color',
  component: FeatureTriColorInput,
};
