<?php


namespace setasign\Fpdi\PdfParser\Filter;

/**
 * Interface for filters
 *
 * @package setasign\Fpdi\PdfParser\Filter
 */
interface FilterInterface
{
    /**
     * Decode a string.
     *
     * @param string $data The input string
     * @return string
     */
    public function decode($data);
}
