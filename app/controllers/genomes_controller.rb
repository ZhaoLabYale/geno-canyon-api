class GenomesController < ApplicationController
  def query
    chr = params["chrom"]
    locs = params["locs"]
    if chr.nil? || locs.nil?
      render json: {
        error: "Bad Query: chrom or locs missing",
      }, status: 400
    else
      candidates = Genome.where(chrom: chr)
      result = Array.new
      locs.each_slice(100_000) do |slice|
        result += candidates.where(loc: slice)
      end
      result.sort_by!(&:loc).uniq!(&:loc)
      result.map!(&:value)
      render json: result
    end
  end
end
