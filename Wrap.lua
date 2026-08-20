-- Wraps the quote text onto multiple lines at word boundaries.
-- Rainmeter String meters do not reliably word-wrap on the W option alone,
-- so we insert the line breaks ourselves and let the meter auto-size.

function Initialize()
    mQuote = SKIN:GetMeasure('MeasureQuoteText')
    maxChars = tonumber(SKIN:GetVariable('MaxChars')) or 42
end

function Update()
    return 0
end

function GetText()
    local text = mQuote:GetStringValue()

    if text == nil or text == '' then
        return ''
    end

    -- Collapse any stray whitespace/escapes coming back from the JSON.
    text = string.gsub(text, '\\n', ' ')
    text = string.gsub(text, '%s+', ' ')
    text = string.gsub(text, '^%s*(.-)%s*$', '%1')

    local lines = {}
    local line = ''

    for word in string.gmatch(text, '%S+') do
        if line == '' then
            line = word
        elseif string.len(line) + 1 + string.len(word) <= maxChars then
            line = line .. ' ' .. word
        else
            table.insert(lines, line)
            line = word
        end
    end

    if line ~= '' then
        table.insert(lines, line)
    end

    return '"' .. table.concat(lines, '\n') .. '"'
end
