import {
  Feature,
  FeatureChoiced,
  FeatureChoicedServerData,
  FeatureDNAColorInput,
  FeatureValueProps,
} from '../../base';
import { FeatureDropdownInput } from '../../dropdowns';

export const dna_ears_color: Feature<string[]> = {
  name: 'Ear color',
  component: FeatureDNAColorInput,
};

export const dna_frills_color: Feature<string[]> = {
  name: 'Frill color',
  component: FeatureDNAColorInput,
};

export const dna_horns_color: Feature<string[]> = {
  name: 'Horn color',
  component: FeatureDNAColorInput,
};

export const dna_tail_color: Feature<string[]> = {
  name: 'Tail color',
  component: FeatureDNAColorInput,
};

export const dna_spines_color: Feature<string[]> = {
  name: 'Spines color',
  component: FeatureDNAColorInput,
};

export const dna_snout_color: Feature<string[]> = {
  name: 'Snout color',
  component: FeatureDNAColorInput,
};

export const dna_wings_color: Feature<string[]> = {
  name: 'Wing color',
  component: FeatureDNAColorInput,
};

export const dna_fluff_color: Feature<string[]> = {
  name: 'Fluff color',
  component: FeatureDNAColorInput,
};

export const feature_anthro_tail: FeatureChoiced = {
  name: 'Tail',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};
