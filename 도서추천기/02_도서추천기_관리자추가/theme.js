const THEME_KEY = 'library-theme-v1';
const DEFAULT_COLOR = '#285d48';
function normalizeColor(value) {
  const hex = String(value).trim();
  if (/^#[0-9a-f]{3}$/i.test(hex)) return '#' + [...hex.slice(1)].map(c => c + c).join('').toLowerCase();
  return /^#[0-9a-f]{6}$/i.test(hex) ? hex.toLowerCase() : null;
}
function readTheme() {
  try { return normalizeColor(JSON.parse(localStorage.getItem(THEME_KEY))) || DEFAULT_COLOR; }
  catch { return DEFAULT_COLOR; }
}
function applyTheme(color, target = document.documentElement) {
  const channels = color.slice(1).match(/../g).map(c => parseInt(c, 16));
  const luminance = channels.map(c => { const v = c / 255; return v <= .04045 ? v / 12.92 : ((v + .055) / 1.055) ** 2.4; }).reduce((sum, v, i) => sum + v * [.2126, .7152, .0722][i], 0);
  target.style.setProperty('--green', color);
  target.style.setProperty('--on-primary', luminance > .179 ? '#17251e' : '#ffffff');
  target.style.setProperty('--accent-text', luminance > .179 ? '#' + channels.map(c => Math.round(c * .45).toString(16).padStart(2, '0')).join('') : color);
}
applyTheme(readTheme());
window.addEventListener('storage', event => {
  if (event.key === THEME_KEY || event.key === null) applyTheme(readTheme());
});
document.addEventListener('DOMContentLoaded', () => {
  const form = document.querySelector('#theme-form');
  if (!form) return;
  const picker = document.querySelector('#theme-picker'), hex = document.querySelector('#theme-hex');
  const preview = document.querySelector('#theme-preview'), status = document.querySelector('#theme-status');
  function draft(color) { picker.value = color; hex.value = color; hex.setCustomValidity(''); applyTheme(color, preview); status.textContent = '미리보기입니다. 저장하면 이용자 페이지에 반영됩니다.'; }
  draft(readTheme()); status.textContent = '현재 저장된 메인 색상입니다.';
  picker.addEventListener('input', () => draft(picker.value));
  hex.addEventListener('input', () => {
    const color = normalizeColor(hex.value);
    hex.setCustomValidity(color ? '' : '#285d48 또는 #285 형태로 입력해주세요.');
    if (color) { picker.value = color; applyTheme(color, preview); }
    status.textContent = color ? '저장 전 미리보기입니다.' : '올바른 HEX 색상 코드를 입력해주세요.';
  });
  document.querySelector('#theme-reset').addEventListener('click', () => draft(DEFAULT_COLOR));
  form.addEventListener('submit', event => {
    event.preventDefault(); const color = normalizeColor(hex.value); if (!color) return;
    try { localStorage.setItem(THEME_KEY, JSON.stringify(color)); applyTheme(color); draft(color); status.textContent = '저장했습니다. 이용자 페이지에도 반영되었습니다.'; }
    catch { status.textContent = '저장하지 못했습니다. 브라우저 저장 공간 설정을 확인해주세요.'; }
  });
});
