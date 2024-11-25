import { Feature, FeatureColorInput } from '../../base';

export const underwear_color: Feature<string> = {
  name: 'Underwear color',
  component: FeatureColorInput,
};

export const undershirt_color: Feature<string> = {
  name: 'Undershirt color',
  component: FeatureColorInput,
};

export const socks_color: Feature<string> = {
  name: 'Socks color',
  component: FeatureColorInput,
};
